//
//  MockProsRouter.swift
//  HomeAdvisorTests
//
//  Created by Jak Jonnalagadda on 12/25/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import XCTest
@testable import HomeAdvisor

class MockProsRouter: HAProsRouting {

    var showProDetailsCalled = false
    var expectationInTesting: XCTestExpectation?

    func showProDetails(for pro: HAPro, from view: HAProsViewing?) {
        showProDetailsCalled = true
        expectationInTesting?.fulfill()
    }
}
