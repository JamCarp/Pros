//
//  ProsPresenterTests.swift
//  HomeAdvisorTests
//
//  Created by Jonnalagadda, Jak on 12/20/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import XCTest
import UIKit
@testable import HomeAdvisor

class ProsPresenterTests: XCTestCase {
    var presenter: HAProsPresenter?
    var view: MockProsViewController?
    var interactor: MockProsInteractor?
    var router: MockProsRouter?

    override func setUp() {
        super.setUp()
        interactor = MockProsInteractor()
        router = MockProsRouter()
        presenter = HAProsPresenter(interactor: interactor!, router: router!)
        view = MockProsViewController(presenter: presenter!)
    }

    override func tearDown() {
        view = nil
        super.tearDown()
    }

    func testPresenterModuleSetup() {

        XCTAssertNotNil(presenter, "Presenter is not creating correct module components.")

        XCTAssertNotNil(presenter?.view, "Presenter is not creating correct module components.")
        XCTAssertNotNil(presenter?.interactor, "Presenter is not creating correct module components.")
        XCTAssertNotNil(presenter?.router, "Presenter is not creating correct module components.")

        XCTAssertNotNil(presenter?.interactor.presenter, "Presenter is not creating correct module components.")
    }

    func testPresenterCallingInteractor() {
        let expectation = XCTestExpectation()
        interactor?.expectationInTesting = expectation
        presenter?.loadAvailablePros()
        wait(for: [expectation], timeout: 1.0)
    }

    func testMultiplePresentersCallingInteractorDifferentThreads() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 10
        interactor?.expectationInTesting = expectation
        for index in 0 ... 10 {
            let messageAccessQueue = DispatchQueue(label: "com.ibata.iOSTests\(index)")
            messageAccessQueue.async {
                self.presenter?.loadAvailablePros()
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testMultiplePresentersCallingInteractorUsingDifferentInteractors() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 10
        presenter?.loadAvailablePros()
        for _ in 0 ... 10 {
            let interactor = MockProsInteractor()
            interactor.expectationInTesting = expectation
            let presenter = HAProsPresenter(interactor: interactor, router: HAProsRouter())
            presenter.loadAvailablePros()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testMultiplePresentersCallingViewDifferentThreads() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 10
        view?.expectationInTesting = expectation
        for index in 0 ... 10 {
            let messageAccessQueue = DispatchQueue(label: "com.ibata.iOSTests\(index)")
            messageAccessQueue.async {
                self.presenter?.loadAvailablePros()
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testMultiplePresentersCallingViewUsingSameThread() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 10
        view?.expectationInTesting = expectation
        for _ in 0 ... 10 {
            DispatchQueue.global(qos: .background).async {
                self.presenter?.loadAvailablePros()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testPresenterCallingRouter() {
        var expectation = XCTestExpectation()
        interactor?.expectationInTesting = expectation
        presenter?.loadAvailablePros()
        wait(for: [expectation], timeout: 1.0)

        expectation = XCTestExpectation()
        router?.expectationInTesting = expectation
        presenter?.selectedPro(at: IndexPath(row: 0, section: 0))
        wait(for: [expectation], timeout: 1.0)
    }

    func testProsModuleIntegration() {
        var expectation = XCTestExpectation()
        interactor?.expectationInTesting = expectation
        presenter?.loadAvailablePros()
        wait(for: [expectation], timeout: 1.0)

        expectation = XCTestExpectation()
        view?.expectationInTesting = expectation
        presenter?.loadAvailablePros()
        wait(for: [expectation], timeout: 1.0)

        expectation = XCTestExpectation()
        router?.expectationInTesting = expectation
        presenter?.selectedPro(at: IndexPath(row: 0, section: 0))
        wait(for: [expectation], timeout: 1.0)
    }

    func testProsPresenterIntegrationAccuracy() {
        let expectation = XCTestExpectation()
        view?.expectationInTesting = expectation
        presenter?.loadAvailablePros()
        wait(for: [expectation], timeout: 1.0)

        let proInfo = presenter?.proInfo(for: IndexPath(row: 0, section: 0))
        XCTAssertEqual(proInfo?.proName, "Summit Preservation, LLC")
        XCTAssertEqual(proInfo?.proRating, "Rating: 5.0 | 7 rating(s)")
        XCTAssertEqual(proInfo?.proRatingColor, .haGreen)
    }

    func testPresentersAccuracyToView() {
        let expectation = XCTestExpectation()
        interactor?.expectationInTesting = expectation
        presenter?.loadAvailablePros()
        wait(for: [expectation], timeout: 1.0)

        XCTAssertNotNil(presenter?.availablePros)
        XCTAssert(presenter?.availablePros.count == 2, "Available Pro Count is not valid.")
        XCTAssert(presenter?.proSections == 1, "Available proSections Count is not valid.")

        let proReceived =  presenter?.availablePros.first
        XCTAssertNotNil(proReceived, "Pro shouldn't be nil.")
        XCTAssertNotNil(proReceived?.entityId, "Pro's entityId should not be nil.")
        XCTAssertEqual(proReceived?.entityId, MockPros.firstPro.entityId)

        XCTAssertNotNil(proReceived?.companyName, "Pro's companyName should not be nil.")
        XCTAssertEqual(proReceived?.companyName, "Summit Preservation, LLC")

        XCTAssertNotNil(proReceived?.companyOverview, "Pro's companyOverview should not be nil.")
        XCTAssertEqual(proReceived?.companyOverview, MockPros.firstPro.companyOverview)

        XCTAssertNotNil(proReceived?.canadianSP, "Pro's canadianSP should not be nil.")
        XCTAssertEqual(proReceived?.canadianSP, MockPros.firstPro.canadianSP)

        XCTAssertNotNil(proReceived?.spanishSpeaking, "Pro's spanishSpeaking should not be nil.")
        XCTAssertEqual(proReceived?.spanishSpeaking, MockPros.firstPro.spanishSpeaking)

        XCTAssertNotNil(proReceived?.primaryLocation, "Pro's primaryLocation should not be nil.")
        XCTAssertEqual(proReceived?.primaryLocation, MockPros.firstPro.primaryLocation)

        XCTAssertNotNil(proReceived?.locationLatitude, "Pro's locationLatitude should not be nil.")
        XCTAssertEqual(proReceived?.locationLatitude, MockPros.firstPro.locationLatitude)

        XCTAssertNotNil(proReceived?.locationLongitude, "Pro's locationLongitude should not be nil.")
        XCTAssertEqual(proReceived?.locationLongitude, MockPros.firstPro.locationLongitude)

        XCTAssertNotNil(proReceived?.servicesOffered, "Pro's servicesOffered should not be nil.")
        XCTAssertEqual(proReceived?.servicesOffered, MockPros.firstPro.servicesOffered)

        XCTAssertNotNil(proReceived?.specialty, "Pro's specialty should not be nil.")
        XCTAssertEqual(proReceived?.specialty, MockPros.firstPro.specialty)

        XCTAssertNotNil(proReceived?.phoneNumber, "Pro's phoneNumber should not be nil.")
        XCTAssertEqual(proReceived?.phoneNumber, MockPros.firstPro.phoneNumber)

        XCTAssertNotNil(proReceived?.email, "Pro's email should not be nil.")
        XCTAssertEqual(proReceived?.email, MockPros.firstPro.email)

        XCTAssertNotNil(proReceived?.ratingCount, "Pro's ratingCount should not be nil.")
        XCTAssertEqual(proReceived?.ratingCount, MockPros.firstPro.ratingCount)

        XCTAssertNotNil(proReceived?.compositeRating, "Pro's compositeRating should not be nil.")
        XCTAssertEqual(proReceived?.compositeRating, MockPros.firstPro.compositeRating)
    }

    func testPresentersAccuracyToViewForLastPro() {
        let expectation = XCTestExpectation()
        interactor?.expectationInTesting = expectation
        presenter?.loadAvailablePros()
        wait(for: [expectation], timeout: 1.0)

        XCTAssertNotNil(presenter?.availablePros)
        XCTAssert(presenter?.availablePros.count == 2, "Available Pro Count is not valid.")
        XCTAssert(presenter?.proSections == 1, "Available proSections Count is not valid.")

        let proReceived =  presenter?.availablePros.last
        XCTAssertNotNil(proReceived, "Pro shouldn't be nil.")
        XCTAssertNotNil(proReceived?.entityId, "Pro's entityId should not be nil.")
        XCTAssertEqual(proReceived?.entityId, MockPros.lastPro.entityId)

        XCTAssertNotNil(proReceived?.companyName, "Pro's companyName should not be nil.")
        XCTAssertEqual(proReceived?.companyName, MockPros.lastPro.companyName)

        XCTAssertNotNil(proReceived?.companyOverview, "Pro's companyOverview should not be nil.")
        XCTAssertEqual(proReceived?.companyOverview, MockPros.lastPro.companyOverview)

        XCTAssertNotNil(proReceived?.canadianSP, "Pro's canadianSP should not be nil.")
        XCTAssertEqual(proReceived?.canadianSP, MockPros.lastPro.canadianSP)

        XCTAssertNotNil(proReceived?.spanishSpeaking, "Pro's spanishSpeaking should not be nil.")
        XCTAssertEqual(proReceived?.spanishSpeaking, MockPros.lastPro.spanishSpeaking)

        XCTAssertNotNil(proReceived?.primaryLocation, "Pro's primaryLocation should not be nil.")
        XCTAssertEqual(proReceived?.primaryLocation, MockPros.lastPro.primaryLocation)

        XCTAssertNotNil(proReceived?.locationLatitude, "Pro's locationLatitude should not be nil.")
        XCTAssertEqual(proReceived?.locationLatitude, MockPros.lastPro.locationLatitude)

        XCTAssertNotNil(proReceived?.locationLongitude, "Pro's locationLongitude should not be nil.")
        XCTAssertEqual(proReceived?.locationLongitude, MockPros.lastPro.locationLongitude)

        XCTAssertNotNil(proReceived?.servicesOffered, "Pro's servicesOffered should not be nil.")
        XCTAssertEqual(proReceived?.servicesOffered, MockPros.lastPro.servicesOffered)

        XCTAssertNotNil(proReceived?.specialty, "Pro's specialty should not be nil.")
        XCTAssertEqual(proReceived?.specialty, MockPros.lastPro.specialty)

        XCTAssertNotNil(proReceived?.phoneNumber, "Pro's phoneNumber should not be nil.")
        XCTAssertEqual(proReceived?.phoneNumber, MockPros.lastPro.phoneNumber)

        XCTAssertNotNil(proReceived?.email, "Pro's email should not be nil.")
        XCTAssertEqual(proReceived?.email, MockPros.lastPro.email)

        XCTAssertNotNil(proReceived?.ratingCount, "Pro's ratingCount should not be nil.")
        XCTAssertEqual(proReceived?.ratingCount, MockPros.lastPro.ratingCount)

        XCTAssertNotNil(proReceived?.compositeRating, "Pro's compositeRating should not be nil.")
        XCTAssertEqual(proReceived?.compositeRating, MockPros.lastPro.compositeRating)
    }
}
