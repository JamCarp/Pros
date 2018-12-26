//
//  ProEntityTests.swift
//  HomeAdvisorTests
//
//  Created by Jonnalagadda, Jak on 12/21/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import XCTest
@testable import HomeAdvisor

class ProEntityTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testNewProEntity() {
        let firstPro = MockPros.firstPro

        XCTAssertNotNil(firstPro, "Pro shouldn't be nil.")
        XCTAssertNotNil(firstPro.entityId, "Pro's entityId should not be nil.")
        XCTAssertEqual(firstPro.entityId, "1222893113", "Pro's entityId should be 1222893113.")

        XCTAssertNotNil(firstPro.companyName, "Pro's companyName should not be nil.")
        XCTAssertEqual(firstPro.companyName, "Summit Preservation, LLC")

        XCTAssertNotNil(firstPro.companyOverview, "Pro's companyOverview should not be nil.")
        XCTAssertEqual(firstPro.companyOverview, "Summit Preservation prides itself on creating beautiful surfaces for your home. You can always expect a great experience with us, a reasonable rate and a quality finish to the job. Call us today!")

        XCTAssertNotNil(firstPro.canadianSP, "Pro's canadianSP should not be nil.")
        XCTAssertEqual(firstPro.canadianSP, false)

        XCTAssertNotNil(firstPro.spanishSpeaking, "Pro's spanishSpeaking should not be nil.")
        XCTAssertEqual(firstPro.spanishSpeaking, false)

        XCTAssertNotNil(firstPro.primaryLocation, "Pro's primaryLocation should not be nil.")
        XCTAssertEqual(firstPro.primaryLocation, "Henderson, CO")

        XCTAssertNotNil(firstPro.locationLatitude, "Pro's locationLatitude should not be nil.")
        XCTAssertEqual(firstPro.locationLatitude, 39.8873)

        XCTAssertNotNil(firstPro.locationLongitude, "Pro's locationLongitude should not be nil.")
        XCTAssertEqual(firstPro.locationLongitude, -104.8805)

        XCTAssertNotNil(firstPro.servicesOffered, "Pro's servicesOffered should not be nil.")
        XCTAssertEqual(firstPro.servicesOffered, "Flooring & Carpet, Tile")

        XCTAssertNotNil(firstPro.specialty, "Pro's specialty should not be nil.")
        XCTAssertEqual(firstPro.specialty, "Additions & Remodeling")

        XCTAssertNotNil(firstPro.phoneNumber, "Pro's phoneNumber should not be nil.")
        XCTAssertEqual(firstPro.phoneNumber, "(330) 555-3136")

        XCTAssertNotNil(firstPro.email, "Pro's email should not be nil.")
        XCTAssertEqual(firstPro.email, "contact@summitpresllc.biz")

        XCTAssertNotNil(firstPro.ratingCount, "Pro's ratingCount should not be nil.")
        XCTAssertEqual(firstPro.ratingCount, 7)

        XCTAssertNotNil(firstPro.compositeRating, "Pro's compositeRating should not be nil.")
        XCTAssertEqual(firstPro.compositeRating, 5.0)
    }

    func testNewProEntityWithOutRating() {
        let proWithOutRating = MockPros.proWithOutRatings

        XCTAssertNotNil(proWithOutRating, "Pro shouldn't be nil.")
        XCTAssertNotNil(proWithOutRating.entityId, "Pro's entityId should not be nil.")
        XCTAssertEqual(proWithOutRating.entityId, "5803803218", "Pro's entityId is wrong.")

        XCTAssertNotNil(proWithOutRating.companyName, "Pro's companyName should not be nil.")
        XCTAssertEqual(proWithOutRating.companyName, "The Worm Drain Cleaning")

        XCTAssertNotNil(proWithOutRating.companyOverview, "Pro's companyOverview should not be nil.")
        XCTAssertEqual(proWithOutRating.companyOverview, "We have over 20 years of experience in the business. Here at The Worm Drain Cleaning, we pride our company on reliability, great communication, integrity, and quality work. We are experts in our trade, and will do our best to keep you as educated as we can on your particular task or project. We look forward to earning your business!")

        XCTAssertNotNil(proWithOutRating.canadianSP, "Pro's canadianSP should not be nil.")
        XCTAssertEqual(proWithOutRating.canadianSP, false)

        XCTAssertNotNil(proWithOutRating.spanishSpeaking, "Pro's spanishSpeaking should not be nil.")
        XCTAssertEqual(proWithOutRating.spanishSpeaking, false)

        XCTAssertNotNil(proWithOutRating.primaryLocation, "Pro's primaryLocation should not be nil.")
        XCTAssertEqual(proWithOutRating.primaryLocation, "Commerce City, CO")

        XCTAssertNil(proWithOutRating.locationLatitude, "Pro's locationLatitude should be nil.")

        XCTAssertNil(proWithOutRating.locationLongitude, "Pro's locationLongitude should be nil.")

        XCTAssertNotNil(proWithOutRating.servicesOffered, "Pro's servicesOffered should not be nil.")
        XCTAssertEqual(proWithOutRating.servicesOffered, "Flooring & Carpet, Tile")

        XCTAssertNotNil(proWithOutRating.specialty, "Pro's specialty should not be nil.")
        XCTAssertEqual(proWithOutRating.specialty, "Plumbing")

        XCTAssertNotNil(proWithOutRating.phoneNumber, "Pro's phoneNumber should not be nil.")
        XCTAssertEqual(proWithOutRating.phoneNumber, "(720) 555-7078")

        XCTAssertNotNil(proWithOutRating.email, "Pro's email should not be nil.")
        XCTAssertEqual(proWithOutRating.email, "contact@theworm.biz")

        XCTAssertNotNil(proWithOutRating.ratingCount, "Pro's ratingCount should not be nil.")
        XCTAssertEqual(proWithOutRating.ratingCount, 0)

        XCTAssertNotNil(proWithOutRating.compositeRating, "Pro's compositeRating should not be nil.")
        XCTAssertEqual(proWithOutRating.compositeRating, 0.0)
    }

    func testNewProEntityWithOutServicesOffered() {
        let proWithOutServices = MockPros.proWithOutServices

        XCTAssertNotNil(proWithOutServices, "Pro shouldn't be nil.")
        XCTAssertNotNil(proWithOutServices.entityId, "Pro's entityId should not be nil.")
        XCTAssertEqual(proWithOutServices.entityId, "5803803218", "Pro's entityId is wrong.")

        XCTAssertNotNil(proWithOutServices.companyName, "Pro's companyName should not be nil.")
        XCTAssertEqual(proWithOutServices.companyName, "The Worm Drain Cleaning")

        XCTAssertNotNil(proWithOutServices.companyOverview, "Pro's companyOverview should not be nil.")
        XCTAssertEqual(proWithOutServices.companyOverview, "We have over 20 years of experience in the business. Here at The Worm Drain Cleaning, we pride our company on reliability, great communication, integrity, and quality work. We are experts in our trade, and will do our best to keep you as educated as we can on your particular task or project. We look forward to earning your business!")

        XCTAssertNotNil(proWithOutServices.canadianSP, "Pro's canadianSP should not be nil.")
        XCTAssertEqual(proWithOutServices.canadianSP, false)

        XCTAssertNotNil(proWithOutServices.spanishSpeaking, "Pro's spanishSpeaking should not be nil.")
        XCTAssertEqual(proWithOutServices.spanishSpeaking, false)

        XCTAssertNotNil(proWithOutServices.primaryLocation, "Pro's primaryLocation should not be nil.")
        XCTAssertEqual(proWithOutServices.primaryLocation, "Commerce City, CO")

        XCTAssertNil(proWithOutServices.locationLatitude, "Pro's locationLatitude should be nil.")

        XCTAssertNil(proWithOutServices.locationLongitude, "Pro's locationLongitude should be nil.")

        XCTAssertNil(proWithOutServices.servicesOffered, "Pro's servicesOffered should be nil.")

        XCTAssertNotNil(proWithOutServices.specialty, "Pro's specialty should not be nil.")
        XCTAssertEqual(proWithOutServices.specialty, "Plumbing")

        XCTAssertNotNil(proWithOutServices.phoneNumber, "Pro's phoneNumber should not be nil.")
        XCTAssertEqual(proWithOutServices.phoneNumber, "(720) 555-7078")

        XCTAssertNotNil(proWithOutServices.email, "Pro's email should not be nil.")
        XCTAssertEqual(proWithOutServices.email, "contact@theworm.biz")

        XCTAssertNotNil(proWithOutServices.ratingCount, "Pro's ratingCount should not be nil.")
        XCTAssertEqual(proWithOutServices.ratingCount, 0)

        XCTAssertNotNil(proWithOutServices.compositeRating, "Pro's compositeRating should not be nil.")
        XCTAssertEqual(proWithOutServices.compositeRating, 0.0)
    }
}
