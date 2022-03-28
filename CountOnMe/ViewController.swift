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

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
            }
        calculator.addNumbers(numbers: numberText)
    }

    @IBAction func taptheOperator(_ sender: UIButton) {
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

    private func alertMessage(message: String) {
        let alertVC = UIAlertController(title: "⚠️ Warning ⚠️", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    // Bind
    private func link() {
        textView.text = "0"
        calculator.messageAlert = alertMessage
        calculator.calculTextView = { calculText in
            DispatchQueue.main.async {
                self.textView.text = calculText
            }
        }
    }
}
