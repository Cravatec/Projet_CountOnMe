//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Modified by Sam on 01/03/2022
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest

@testable import CountOnMe

class CalculatorTests: XCTestCase {

    var calculator: Calculator!

    // init
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    // test for addition
    func testGivenCanAddOperator_WhenCanAddOperator_ThenReturnEqual() {
        calculator.calculString = " 1 + 2 + 3 "
        XCTAssertTrue(calculator.canAddOperator)
    }
    
    func testGivenExpressionIsCorrect_WhenCanCalculate_ThenReturnTrue() {
        calculator.addNumbers(numbers: "7")
        calculator.addOperator(with: "x")
        calculator.addNumbers(numbers: "8")
        calculator.result()
        XCTAssertEqual(calculator.calculString, "7 x 8 = 56")
    }
    
    func testGivenExpressionIsCorrect_WhenCanDivide_TheReturnTrue(){
        calculator.addNumbers(numbers: "84")
        calculator.addOperator(with: "÷")
        calculator.addNumbers(numbers: "2")
        calculator.result()
        XCTAssertEqual(calculator.calculString, "84 ÷ 2 = 42")
    }
    
    func testGivenNumber_WhenDoReformat_ThenCheckResult() {
        calculator.addNumbers(numbers: "100")
        calculator.addOperator(with: "÷")
        calculator.addNumbers(numbers: "3")
        calculator.result()
        XCTAssertEqual(calculator.calculString, "100 ÷ 3 = 33.333")
    }
    
    func testGivenMultiOperator_WhenTryAdditionAndSubstraction_ThenAlertMessage() {
            calculator.reset()
            calculator.addOperator(with: "+")
            calculator.addOperator(with: "-")
            XCTAssertEqual(calculator.calculString, "")
        }
    
    func testGivenNumberToDivide_WhenDivideByZero_ThenNil() {
        calculator.addNumbers(numbers: "1")
        calculator.addOperator(with: "÷")
        calculator.addNumbers(numbers: "0")
        calculator.result()
        XCTAssertEqual(calculator.calculString, "")
    }
}
