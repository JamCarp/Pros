//
//  ProsRouterTests.swift
//  HomeAdvisorTests
//
//  Created by Jonnalagadda, Jak on 12/21/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import XCTest
@testable import HomeAdvisor

class ProsRouterTests: XCTestCase {

    let prosRouter = HAProsRouter()

    func testProsRouter() {
        let prosVC = HAProsRouter.prosModule

        //XCTAssert(prosVC is ProsViewing, "Router is not creating correct module components.")
        XCTAssertNotNil(prosVC.presenter)
        XCTAssert(prosVC.presenter is HAProsPresenter, "Router is not creating correct module components.")

        XCTAssert(prosVC.presenter.view is HAProsViewController, "Router is not creating correct module components.")
        XCTAssert(prosVC.presenter.interactor is HAProsInteractor, "Router is not creating correct module components.")
        XCTAssert(prosVC.presenter.router is HAProsRouter, "Router is not creating correct module components.")

        XCTAssert(prosVC.presenter.interactor.presenter is HAProsPresenter, "Router is not creating correct module components.")
    }

    func testProDetailsNavigation() {
        let presenter  = MockProsPresenter(interactor: MockProsInteractor(),
                                        router: HAProsRouter())
        let mockProsVC = MockProsViewController(presenter: presenter)
        prosRouter.showProDetails(for: MockPros.firstPro, from: mockProsVC)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
