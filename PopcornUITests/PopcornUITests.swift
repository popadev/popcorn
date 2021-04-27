//
//  PopcornUITests.swift
//  PopcornUITests
//
//  Created by Petru Popa on 4/22/21.
//

import XCTest

class PopcornUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchAndDetail() throws {
        let app = XCUIApplication()
        app.launch()

        app.textFields.element.tap()
        app.keys["t"].tap()
        app.keys["i"].tap()
        app.keys["t"].tap()
        app.keys["a"].tap()
        app.keys["n"].tap()
        app.keys["i"].tap()
        app.keys["c"].tap()
        app.keyboards.buttons["Search"].tap()
        
        app.tables.element.tap(withNumberOfTaps: 1, numberOfTouches: 1)
        
        app.buttons["Back"].tap()
        
        app.buttons["Back"].tap()
    }

}
