//
//  ProsInteractorTests.swift
//  HomeAdvisorTests
//
//  Created by Jonnalagadda, Jak on 12/20/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import XCTest
@testable import HomeAdvisor

class ProsInteractorTests: XCTestCase {

    var interactor: HAProsInteractor?
    var presenter: MockProsPresenter?

    override func setUp() {
        super.setUp()
        interactor = HAProsInteractor()
        presenter  = MockProsPresenter(interactor: interactor!,
                                             router: HAProsRouter())
        interactor?.presenter = presenter
    }

    override func tearDown() {
        interactor = nil
        presenter  = nil
        super.tearDown()
    }

    func testIfInteractorResponding() {
        let expectation = XCTestExpectation()
        presenter?.expectationInTesting = expectation
        interactor?.getAllAvailableHAProsForCurrentUser()
        wait(for: [expectation], timeout: 1.0)
    }

    func testInteractorsResponseForAccuracy() {
        let expectation = XCTestExpectation()
        presenter?.expectationInTesting = expectation
        interactor?.getAllAvailableHAProsForCurrentUser()
        wait(for: [expectation], timeout: 1.0)

        let firstProReceived =  presenter?.availablePros[14]
        XCTAssertNotNil(firstProReceived, "Pro shouldn't be nil.")
        XCTAssertNotNil(firstProReceived?.entityId, "Pro's entityId should not be nil.")
        XCTAssertEqual(firstProReceived?.entityId, "1222893113", "Pro's entityId should be 1222893113.")

        XCTAssertNotNil(firstProReceived?.companyName, "Pro's companyName should not be nil.")
        XCTAssertEqual(firstProReceived?.companyName, "Summit Preservation, LLC")

        XCTAssertNotNil(firstProReceived?.companyOverview, "Pro's companyOverview should not be nil.")
        XCTAssertEqual(firstProReceived?.companyOverview, "Summit Preservation prides itself on creating beautiful surfaces for your home. You can always expect a great experience with us, a reasonable rate and a quality finish to the job. Call us today!")

        XCTAssertNotNil(firstProReceived?.canadianSP, "Pro's canadianSP should not be nil.")
        XCTAssertEqual(firstProReceived?.canadianSP, false)

        XCTAssertNotNil(firstProReceived?.spanishSpeaking, "Pro's spanishSpeaking should not be nil.")
        XCTAssertEqual(firstProReceived?.spanishSpeaking, false)

        XCTAssertNotNil(firstProReceived?.primaryLocation, "Pro's primaryLocation should not be nil.")
        XCTAssertEqual(firstProReceived?.primaryLocation, "Henderson, CO")

        XCTAssertNotNil(firstProReceived?.locationLatitude, "Pro's locationLatitude should not be nil.")
        XCTAssertEqual(firstProReceived?.locationLatitude, 39.8873)

        XCTAssertNotNil(firstProReceived?.locationLongitude, "Pro's locationLongitude should not be nil.")
        XCTAssertEqual(firstProReceived?.locationLongitude, -104.8805)

        XCTAssertNotNil(firstProReceived?.servicesOffered, "Pro's servicesOffered should not be nil.")
        XCTAssertEqual(firstProReceived?.servicesOffered, "Flooring & Carpet, Tile")

        XCTAssertNotNil(firstProReceived?.specialty, "Pro's specialty should not be nil.")
        XCTAssertEqual(firstProReceived?.specialty, "Additions & Remodeling")

        XCTAssertNotNil(firstProReceived?.phoneNumber, "Pro's phoneNumber should not be nil.")
        XCTAssertEqual(firstProReceived?.phoneNumber, "(330) 555-3136")

        XCTAssertNotNil(firstProReceived?.email, "Pro's email should not be nil.")
        XCTAssertEqual(firstProReceived?.email, "contact@summitpresllc.biz")

        XCTAssertNotNil(firstProReceived?.ratingCount, "Pro's ratingCount should not be nil.")
        XCTAssertEqual(firstProReceived?.ratingCount, 7)

        XCTAssertNotNil(firstProReceived?.compositeRating, "Pro's compositeRating should not be nil.")
        XCTAssertEqual(firstProReceived?.compositeRating, 5.0)
    }

    func testInteractorsLastResponseForAccuracy() {
        let expectation = XCTestExpectation()
        presenter?.expectationInTesting = expectation
        interactor?.getAllAvailableHAProsForCurrentUser()
        wait(for: [expectation], timeout: 1.0)

        let lastProReceived =  presenter?.availablePros[15]
        XCTAssertNotNil(lastProReceived, "Pro shouldn't be nil.")
        XCTAssertNotNil(lastProReceived?.entityId, "Pro's entityId should not be nil.")
        XCTAssertEqual(lastProReceived?.entityId, "5803803218", "Pro's entityId is wrong.")

        XCTAssertNotNil(lastProReceived?.companyName, "Pro's companyName should not be nil.")
        XCTAssertEqual(lastProReceived?.companyName, "The Worm Drain Cleaning")

        XCTAssertNotNil(lastProReceived?.companyOverview, "Pro's companyOverview should not be nil.")
        XCTAssertEqual(lastProReceived?.companyOverview, "We have over 20 years of experience in the business. Here at The Worm Drain Cleaning, we pride our company on reliability, great communication, integrity, and quality work. We are experts in our trade, and will do our best to keep you as educated as we can on your particular task or project. We look forward to earning your business!")

        XCTAssertNotNil(lastProReceived?.canadianSP, "Pro's canadianSP should not be nil.")
        XCTAssertEqual(lastProReceived?.canadianSP, false)

        XCTAssertNotNil(lastProReceived?.spanishSpeaking, "Pro's spanishSpeaking should not be nil.")
        XCTAssertEqual(lastProReceived?.spanishSpeaking, false)

        XCTAssertNotNil(lastProReceived?.primaryLocation, "Pro's primaryLocation should not be nil.")
        XCTAssertEqual(lastProReceived?.primaryLocation, "Commerce City, CO")

        XCTAssertNil(lastProReceived?.locationLatitude, "Pro's locationLatitude should be nil.")

        XCTAssertNil(lastProReceived?.locationLongitude, "Pro's locationLongitude should be nil.")

        XCTAssertNil(lastProReceived?.servicesOffered, "Pro's servicesOffered should be nil.")

        XCTAssertNotNil(lastProReceived?.specialty, "Pro's specialty should not be nil.")
        XCTAssertEqual(lastProReceived?.specialty, "Plumbing")

        XCTAssertNotNil(lastProReceived?.phoneNumber, "Pro's phoneNumber should not be nil.")
        XCTAssertEqual(lastProReceived?.phoneNumber, "(720) 555-7078")

        XCTAssertNotNil(lastProReceived?.email, "Pro's email should not be nil.")
        XCTAssertEqual(lastProReceived?.email, "contact@theworm.biz")

        XCTAssertNotNil(lastProReceived?.ratingCount, "Pro's ratingCount should not be nil.")
        XCTAssertEqual(lastProReceived?.ratingCount, 0)

        XCTAssertNotNil(lastProReceived?.compositeRating, "Pro's compositeRating should not be nil.")
        XCTAssertEqual(lastProReceived?.compositeRating, 0.0)
    }

    func testJsonReading() {
        let expectation = XCTestExpectation()
        LocalJSONCoordinator.shared.getHAProsfromHAProsJsonFile(onSuccess: { pros in
            expectation.fulfill()
        }) { error in}
        wait(for: [expectation], timeout: 1.0)
    }

    func testJsonReadingWithCount() {
        LocalJSONCoordinator.shared.getHAProsfromHAProsJsonFile(onSuccess: { pros in
            XCTAssert(pros.count == 20, "Interactor is not parsing the entire json.")
        }) { error in}
    }

    func testMultipleJsonReadingsUsingDifferentThreads() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 100
        for index in 0 ... 100 {
            let messageAccessQueue = DispatchQueue(label: "com.ibata.iOSTests\(index)")
            messageAccessQueue.async {
                LocalJSONCoordinator.shared.getHAProsfromHAProsJsonFile(onSuccess: { pros in
                    expectation.fulfill()
                }) { error in}
            }
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testMultipleJsonReadingsUsingDifferentInteractors() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 100
        for _ in 0 ... 100 {
            let jSonCoordinator = LocalJSONCoordinator()
            jSonCoordinator.getHAProsfromHAProsJsonFile(onSuccess: { pros in
                expectation.fulfill()
            }) { error in}
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
