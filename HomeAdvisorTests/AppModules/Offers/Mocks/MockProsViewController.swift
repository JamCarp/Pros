//
//  MockProsViewController.swift
//  HomeAdvisorTests
//
//  Created by Jonnalagadda, Jak on 12/21/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import UIKit
import XCTest
@testable import HomeAdvisor

class MockProsViewController: UIViewController, HAProsViewing {
    var presenter: HAProsPresenting!

    var updateAvailableProsCalled = false
    var showSomethingWentWrongAlertCalled = false
    var expectationInTesting: XCTestExpectation?
    
    required init(presenter: HAProsPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.view = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateAvailableHAPros() {
        updateAvailableProsCalled = true
        expectationInTesting?.fulfill()
    }

    func showSomethingWentWrongAlert() {
        showSomethingWentWrongAlertCalled = true
        expectationInTesting?.fulfill()
    }
}
