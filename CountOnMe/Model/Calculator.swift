//
//  ModelCalcul.swift
//  CountOnMe
//
//  Created by Sam on 16/03/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {

    var messageAlert: ((String) -> Void)?
    var calculTextView: ((String) -> Void)?
    
    init() {
        self.calculString = ""
    }

    // for the textView
    var calculString: String {
        didSet {
            calculTextView?(calculString)
        }
    }

    // for the numbers in textView
    private var elements: [String] {
        return calculString.split(separator: " ").map { "\($0)" }
    }

    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }

    var expressionHaveResult: Bool {
        return calculString.firstIndex(of: "=") != nil
    }

    // For the safety of the universe
    var divideZero: Bool {
        return calculString.contains("÷ 0")
    }

    // check for starting with a number
    var startWithNumber: Bool {
        if calculString >= "0" && calculString <= "9" {
            return elements.count >= 1
        } else {
            messageAlert?("You can't start with an operator!")
        }
        return false
    }

    // check for adding numbers
    func addNumbers(numbers: String) {
        if expressionHaveResult {
            calculString = ""
        }
        calculString.append(numbers)
    }

    // check for a operator
    func addOperator(with operators: String) {
        if startWithNumber {
            if canAddOperator {
                 calculString.append(" \(operators) ")
             } else {
                 messageAlert?("An operator is already in")
             }
        }
    }

    private func canProceed() -> Bool {
        guard expressionIsCorrect else {
            messageAlert?("Enter a correct expression!")
            return false
        }

        guard expressionHaveEnoughElement else {
            messageAlert?("Start a new calculation!")
            return false
        }

        guard !divideZero else {
            messageAlert?("Impossible to divide by 0! You can make the planet collapse. Be careful with that!")
            calculString.removeAll()
            calculTextView?("0")
            return false
        }
        return true
    }
    
    // reset for the AC Button
    func reset() {
        calculString.removeAll()
        calculTextView?("0")
    }
    
    // func result when all conditions are ok
    func result() {
        
        guard canProceed() else {
            return
        }
                
        // for calculate
        var operationsToReduce = elements

        while operationsToReduce.count > 1 {

            guard var left = Double(operationsToReduce[0]) else { return }
            var operand = operationsToReduce[1]
            guard var right = Double(operationsToReduce[2]) else { return }

            let result: Double

            // Start at one or we can't assign index to (index - 1)
                var operandIndex = 1

            // Check for reduce the divide sign then add to index
                if let index = operationsToReduce.firstIndex(where: { $0 == "x" || $0 == "÷" }) {

                    operandIndex = index
                    if let leftunwrapp = Double(operationsToReduce[index - 1]) { left = leftunwrapp }
                    operand = operationsToReduce[index]
                    if let rightUnwrapp = Double(operationsToReduce[index + 1]) { right = rightUnwrapp }
                }

            result = calculate(left: Double(left), right: Double(right), operand: operand)

            // Remove the extra operator
                for _ in 1...3 {
                    operationsToReduce.remove(at: operandIndex - 1)
                }
            operationsToReduce.insert(formatResult(result: Double(result)), at: operandIndex - 1 )

        }
            guard let finalResult = operationsToReduce.first else { return }
            calculString.append(" = \(finalResult)")
    }

    func calculate(left: Double, right: Double, operand: String) -> Double {

        let result: Double
           switch operand {
           case "+": result = left + right
           case "-": result = left - right
           case "÷": result = left / right
           case "x": result = left * right
           default: return 0.0
           }
           return result
       }

    // reformat to have only 3 numbers after the point
     private func formatResult(result: Double) -> String {
          let formatter = NumberFormatter()
          formatter.maximumFractionDigits = 3
          guard let resultFormated = formatter.string(from: NSNumber(value: result)) else { return String() }
          return resultFormated
      }
}
