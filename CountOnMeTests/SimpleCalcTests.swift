//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
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
}
