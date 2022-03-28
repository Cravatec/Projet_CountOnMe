//
//  SimpleCalcUITests.swift
//  SimpleCalcUITests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest

class SimpleCalcUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the app that they test. Doing this in setup will make sure it happens for each test
        XCUIApplication().launch()
    }

    func testButton12AndAddition() {
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
    }

    func testButton34AndSubstraction() {
        app.buttons["3"].tap()
        app.buttons["-"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
    }

    func testButton56AndMultiplication() {
        app.buttons["5"].tap()
        app.buttons["x"].tap()
        app.buttons["6"].tap()
        app.buttons["="].tap()
    }

    func testButton78AndDivide() {
        app.buttons["7"].tap()
        app.buttons["÷"].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
    }

    func testButton90andAC() {
        app.buttons["0"].tap()
        app.buttons["9"].tap()
        app.buttons["AC"].tap()
    }

    func testCloseMessageAlert() {
        app.buttons["2"].tap()
        app.buttons["÷"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        app.alerts["⚠️ Warning ⚠️"].scrollViews.otherElements.buttons["OK"].tap()
    }

    func testOperatorAtFirst() {
        app.buttons["÷"].tap()
        app.alerts["⚠️ Warning ⚠️"].scrollViews.otherElements.buttons["OK"].tap()
    }

    func testStartWithEqual() {
        app.buttons["="].tap()
        XCUIApplication().alerts["⚠️ Warning ⚠️"].scrollViews.otherElements.buttons["OK"].tap()
    }
}
