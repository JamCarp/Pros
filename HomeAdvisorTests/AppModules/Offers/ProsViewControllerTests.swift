//
//  ProsViewControllerTests.swift
//  HomeAdvisorTests
//
//  Created by Jak Jonnalagadda on 12/25/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import XCTest
@testable import HomeAdvisor

class ProsViewControllerTests: XCTestCase {
    var prosVC: HAProsViewController?
    var prosPresenter: MockProsPresenter?

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        prosVC = storyboard.instantiateViewController(withIdentifier: "HAPros") as? HAProsViewController
        prosPresenter = MockProsPresenter(interactor: MockProsInteractor(),
                                          router: MockProsRouter())
        prosVC?.presenter = prosPresenter
    }

    override func tearDown() {
        prosPresenter = nil
        prosVC = nil
        super.tearDown()
    }

    func testProsVCCreated() {
        XCTAssertNotNil(prosVC, "ProsVC should be created.")
    }

    func testProsVCModuleSetup() {
        XCTAssertNotNil(prosVC?.presenter)

        XCTAssertNotNil(prosVC?.presenter.view, "ProsVC is not creating correct module components.")
        XCTAssertNotNil(prosVC?.presenter.interactor, "ProsVC is not creating correct module components.")
        XCTAssertNotNil(prosVC?.presenter.router, "ProsVC is not creating correct module components.")

        XCTAssertNotNil(prosVC?.presenter.interactor.presenter, "ProsVC is not creating correct module components.")
    }

    func testProsVCInitialization() {
        XCTAssertEqual(prosVC?.navigationItem.title, "Pros", "ProsVCs navigation item is not initialized properly.")
        XCTAssertNotNil(prosVC?.tableView, "ProsVCs TableView is not created.")
        XCTAssertEqual(prosVC?.tableView.numberOfSections, 1, "ProsVCs TableViews Data Source is not set properly.")
        XCTAssertEqual(prosVC?.tableView.numberOfRows(inSection: 0), 2, "ProsVCs TableViews Data Source is not set properly.")
    }

    func testViewCallingPresenter() {
        let expectation = XCTestExpectation()
        prosPresenter?.expectationInTesting = expectation
        prosVC?.presenter.loadAvailablePros()
        wait(for: [expectation], timeout: 1.0)
        prosVC?.tableView.reloadData()
        XCTAssertEqual(prosVC?.tableView.numberOfSections, 1, "ProsVCs TableViews Data Source is not set properly.")
        XCTAssertEqual(prosVC?.tableView.numberOfRows(inSection: 0), 2, "ProsVCs TableViews Data Source is not set properly.")
    }

    func testViewCallingPresenterAfterSelection() {
        var expectation = XCTestExpectation()
        prosPresenter?.expectationInTesting = expectation
        prosVC?.presenter.loadAvailablePros()
        wait(for: [expectation], timeout: 1.0)
        expectation = XCTestExpectation()
        prosPresenter?.expectationInTesting = expectation
        prosVC?.tableView.selectRow(at: IndexPath(row: 0, section: 0),
                                    animated: true,
                                    scrollPosition: .none)
        wait(for: [expectation], timeout: 1.0)
    }
}
