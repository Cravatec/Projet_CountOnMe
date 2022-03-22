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

class CalculatorTest: XCTestCase {

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
}
