//
//  MockProsInteractor.swift
//  HomeAdvisorTests
//
//  Created by Jonnalagadda, Jak on 12/21/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import XCTest
@testable import HomeAdvisor

class MockProsInteractor: HAProsInteracting {

    weak var presenter: HAProsInteractingOut?

    var getAllAvailableProsCalled = false
    var expectationInTesting: XCTestExpectation?

    func getAllAvailableHAProsForCurrentUser() {
        getAllAvailableProsCalled = true
        presenter?.setAllAvailableHAProsForCurrentUser(pros: [MockPros.firstPro, MockPros.lastPro])
        expectationInTesting?.fulfill()
    }
}
