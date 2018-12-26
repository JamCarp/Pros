//
//  HomeAdvisorUITests.swift
//  HomeAdvisorUITests
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import XCTest

class HomeAdvisorUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app.terminate()
        app = nil
        super.tearDown()
    }

    /// Tests Offer Details screen layout and if selected Pro details are
    /// correctly being displayed.
    func testOfferDetailsScreen() {

        var appNavTitle = app.navigationBars["Pros"]
        if !appNavTitle.exists {
            waitForNavBar(nabBar: appNavTitle)
        }
        XCTAssertNotNil(appNavTitle, "Navigation Bar title is missing.")

        let firstProCell = app.tables.children(matching: .cell).element(boundBy: 0)
        if !firstProCell.exists {
            waitForOffersToLoad(firstOffer: firstProCell)
        }
        XCTAssertNotNil(firstProCell, "FirstProCell is missing.")
        XCTAssertEqual(firstProCell.label, "AAA Service Plumbing, Inc., Rating: 4.59 | 179 rating(s)", "FirstProCell's info is missing.")

        let cellNameLabel = app.tables.cells.containing(.staticText, identifier: "CellProName").element(boundBy: 0)
        if !cellNameLabel.exists {
            waitForOffersToLoad(firstOffer: cellNameLabel)
        }
        XCTAssertNotNil(cellNameLabel, "FirstProCell's Name is missing.")

        let cellRatingLabel = app.tables.cells.containing(.staticText, identifier: "CellProRating").element(boundBy: 0)
        if !cellRatingLabel.exists {
            waitForOffersToLoad(firstOffer: cellRatingLabel)
        }
        XCTAssertNotNil(cellRatingLabel, "FirstProCell's Rating is missing.")

        firstProCell.tap()

        appNavTitle = app.navigationBars["Details"]
        if !appNavTitle.exists {
            waitForNavBar(nabBar: appNavTitle)
        }
        XCTAssertNotNil(appNavTitle, "Details screen NavBar title is missing.")

        let nameLabel = app.staticTexts["DetailsNameLabel"]
        XCTAssertNotNil(nameLabel, "NameLabel is missing.")
        XCTAssertEqual(nameLabel.label, "AAA Service Plumbing, Inc.", "NameLabel's info is missing.")

        let specialityLabel = app.staticTexts["DetailsSpecialityLabel"]
        XCTAssertNotNil(specialityLabel, "SpecialityLabel is missing.")
        XCTAssertEqual(specialityLabel.label, "Plumbing", "SpecialityLabel's info is missing.")

        let ratingsLabel = app.staticTexts["DetailsRatingLabel"]
        XCTAssertNotNil(ratingsLabel, "SpecialityLabel is missing.")
        XCTAssertEqual(ratingsLabel.label, "Rating: 4.59 | 179 rating(s)", "RatingsLabel's info is missing.")

        let locationLabel = app.staticTexts["DetailsLocationLabel"]
        XCTAssertNotNil(locationLabel, "LocationLabel is missing.")
        XCTAssertEqual(locationLabel.label, "Arvada, CO", "LocationLabel's info is missing.")

        let servicesLabel = app.staticTexts["DetailsServicesLabel"]
        XCTAssertNotNil(servicesLabel, "ServicesLabel is missing.")
        XCTAssertEqual(servicesLabel.label, "Plumbing", "ServicesLabel's info is missing.")

        let overviewTextView = app.textViews["DetailsOverTextView"]
        XCTAssertNotNil(overviewTextView, "OverviewTextView is missing.")
        XCTAssertEqual(overviewTextView.value as? String, "$99 Drains Is the best choice for fast affordable drain service!  Do you need it cleared NOW!  Do you want a reasonable price!  We ensure superior service and expert craftsmanship on every call!!", "OverviewTextView's info is missing.")

        let callButton = app.buttons["DetailsCallButton"]
        XCTAssertNotNil(callButton, "Call Button is missing.")
        XCTAssertEqual(callButton.label, "CALL", "Call Button's info is missing.")

        let emailButton = app.buttons["DetailsEmailButton"]
        XCTAssertNotNil(emailButton, "Email Button is missing.")
        XCTAssertEqual(emailButton.label, "EMAIL", "Email Button's info is missing.")

        let detailsBackButton = app.navigationBars.buttons.element(boundBy: 0)
        XCTAssert(detailsBackButton.exists, "Details Navigation Back Button is missing.")
        if !detailsBackButton.exists {
            waitForBackButton(backButton: detailsBackButton)
        }

        detailsBackButton.tap()
    }

    func waitForNavBar(nabBar: XCUIElement) {
        let appNavPredicate = NSPredicate(format: "exists == true")
        expectation(for: appNavPredicate, evaluatedWith: nabBar, handler: nil)
    }

    func waitForOffersToLoad(firstOffer: XCUIElement) {
        let offersLoadedPredicate = NSPredicate(format: "exists == true")
        expectation(for: offersLoadedPredicate, evaluatedWith: firstOffer, handler: nil)
        waitForExpectations(timeout: 3, handler: nil)
    }

    func waitForBackButton(backButton: XCUIElement) {
        let appNavPredicate = NSPredicate(format: "exists == true")
        expectation(for: appNavPredicate, evaluatedWith: backButton, handler: nil)
        waitForExpectations(timeout: 3, handler: nil)
    }
}
