//
//  ChantalUITests.swift
//  ChantalUITests
//
//  Created by Daniil Karpov on 28.05.2024.
//  Copyright © 2024 Monte Thakkar. All rights reserved.
//

import XCTest

final class ChantalUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func createTask() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.navigationBars.buttons["Add"].tap()
        
        app.alerts.textFields["Enter task name..."].tap()
        app.alerts.textFields["Enter task name..."].typeText("Задача")
        
        app.alerts.scrollViews.otherElements.buttons["Add"].tap()
    }
    

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.navigationBars.buttons["Add"].tap()
        
        app.alerts.textFields["Enter task name..."].tap()
        app.alerts.textFields["Enter task name..."].typeText("Задача")
        
        app.alerts.scrollViews.otherElements.buttons["Add"].tap()
        
        XCTAssert(app.cells.staticTexts["Задача"].exists)
        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testFinishTask() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        try createTask()
        
        XCTAssert(app.cells.staticTexts["Задача"].exists)
        
        app.tables.staticTexts["Задача"].swipeLeft()
        
        XCTAssert(app.cells.staticTexts["Задача"].exists)
    }
    
    func testDeletePlannedTask() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        try createTask()
        
        XCTAssert(app.cells.staticTexts["Задача"].exists)
    
        app.tables.staticTexts["Задача"].swipeLeft()
        app.tables.buttons["delete"].tap()
        
        XCTAssertFalse(app.cells.staticTexts["Задача"].exists)
    }
    
    func testDeleteFinishedTask() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        try createTask()
        
        app.tables.staticTexts["Задача"].swipeRight()
        app.tables.buttons["done"].tap()
        app.tables.staticTexts["Задача"].swipeLeft()
        app.tables.buttons["delete"].tap()
    
                                        
        XCTAssertFalse(app.cells.staticTexts["Задача"].exists)
        
    }
    
    func testMarkTaskDone() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        try createTask()
        
        app.tables.staticTexts["Задача"].swipeRight()
        app.tables.buttons["done"].tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
