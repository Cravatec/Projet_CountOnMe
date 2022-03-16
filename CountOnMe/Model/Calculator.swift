//
//  ModelCalcul.swift
//  CountOnMe
//
//  Created by Sam on 16/03/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    enum Operator: String {
        case addition = "+"
        case subtraction = "-"
        case division = "÷"
        case multiplication = "x"
    }
    var elements: [String] = []
    
    // Create local copy of operations
    func calculate() -> String {
        var operationsToReduce = elements
        
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Double(operationsToReduce[0])!
            let operand = Operator(rawValue: operationsToReduce[1])
            let right = Double(operationsToReduce[2])!
            
            let result: Double
            switch operand {
            case .addition: result = left + right
            case .subtraction: result = left - right
            case .multiplication: result = left * right
            case .division: result = left / right
            default: return ""
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        return operationsToReduce.first!
    }
    
    func reset() {
        elements = []
    }
}
