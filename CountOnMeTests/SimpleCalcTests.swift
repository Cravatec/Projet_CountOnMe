//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Sam on 01/03/2022
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
    func testAddition() {
        calculator.calculString = " 1 + 2 + 3 "
        XCTAssertTrue(calculator.canAddOperator)
    }

    func testAdditionWithBigNumbers() {
        calculator.addNumbers(numbers: "1")
        calculator.addNumbers(numbers: "2")
        calculator.addNumbers(numbers: "3")
        calculator.addOperator(with: "+")
        calculator.addNumbers(numbers: "4")
        calculator.addNumbers(numbers: "5")
        calculator.addNumbers(numbers: "6")
        calculator.result()
        XCTAssertEqual(calculator.calculString, "123 + 456 = 579")
    }

    func testMultiplication() {
        calculator.addNumbers(numbers: "7")
        calculator.addOperator(with: "x")
        calculator.addNumbers(numbers: "8")
        calculator.result()
        XCTAssertEqual(calculator.calculString, "7 x 8 = 56")
    }

    func testDivision() {
        calculator.addNumbers(numbers: "84")
        calculator.addOperator(with: "÷")
        calculator.addNumbers(numbers: "2")
        calculator.result()
        XCTAssertEqual(calculator.calculString, "84 ÷ 2 = 42")
    }

    func testDivisionWithReformat() {
        calculator.addNumbers(numbers: "100")
        calculator.addOperator(with: "÷")
        calculator.addNumbers(numbers: "3")
        calculator.result()
        XCTAssertEqual(calculator.calculString, "100 ÷ 3 = 33.333")
    }

    func testDivisionWithZero() {
        calculator.addNumbers(numbers: "1")
        calculator.addOperator(with: "÷")
        calculator.addNumbers(numbers: "0")
        calculator.result()
        XCTAssertEqual(calculator.calculString, "")
    }
    func testSubstraction() {
        calculator.addNumbers(numbers: "59")
        calculator.addOperator(with: "-")
        calculator.addNumbers(numbers: "9")
        calculator.result()
        XCTAssertEqual(calculator.calculString, "59 - 9 = 50")
    }
}
