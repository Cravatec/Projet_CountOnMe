//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Modified by Sam on 01/03/2022
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let calculator = Calculator()

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
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
        return textView.text.firstIndex(of: "=") != nil
    }

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calculator.addNumbers(numbers: numberText)
    }

    @IBAction func tappetheOperator(_ sender: UIButton) {
        guard let operators = sender.titleLabel?.text else { return }
        calculator.addOperator(with: operators)
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculator.result()
    }

    @IBAction func resetButton(_ sender: UIButton) {
        calculator.reset()
    }

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        link()
    }

    func alertMessage(message: String) {
        let alertVC = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    func link() {
        calculator.messageAlert = alertMessage
        calculator.calculTextView = { calculText in
        self.textView.text = calculText
        }
    }
}
