//
//  AppDelegateTests.swift
//  HomeAdvisorTests
//
//  Created by Jonnalagadda, Jak on 12/20/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import XCTest
@testable import HomeAdvisor

class AppDelegateTests: XCTestCase {

    var appDelegate: AppDelegate?

    override func setUp() {
        super.setUp()
        appDelegate = AppDelegate()
    }

    override func tearDown() {
        appDelegate = nil
        super.tearDown()
    }

    func testLaunchingWithOptions() {
        XCTAssertNotNil(appDelegate?.application(UIApplication.shared, didFinishLaunchingWithOptions: [:]), "AppDelegate -> Delegate didFinishLaunchingWithOptions should be True")
        XCTAssert(appDelegate?.application(UIApplication.shared, didFinishLaunchingWithOptions: [:]) ?? false, "AppDelegate -> Delegate didFinishLaunchingWithOptions should be True")
    }

    func testWindowAndRootVC() {
        XCTAssertNil(appDelegate?.window, "AppDelegate's Window should be nil before launch.")
        let _ = appDelegate?.application(UIApplication.shared, didFinishLaunchingWithOptions: [:])
        XCTAssertNotNil(appDelegate?.window, "AppDelegate's Window should be set after launch.")

        XCTAssertNotNil(appDelegate?.window?.rootViewController, "App's RootViewController should be set after launch.")
        XCTAssert(appDelegate?.window?.rootViewController is UINavigationController, "App's RootViewController should be UINavigationController.")

        let topVC = (appDelegate?.window?.rootViewController as? UINavigationController)?.topViewController
        XCTAssertNotNil(topVC, "RootViewController's topVC should be set after launch.")
        XCTAssert(topVC is HAProsViewController, "RootViewController's topVC should be HAProsViewController.")
    }

    func testApplicationsWindowActiveness() {
        let _ = appDelegate?.application(UIApplication.shared, didFinishLaunchingWithOptions: [:])
        XCTAssertNotNil(appDelegate?.window, "AppDelegate's Window should be set after launch.")
        XCTAssertTrue(appDelegate?.window?.isKeyWindow ?? false, "AppDelegates window is not App's KeyWindow.")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
