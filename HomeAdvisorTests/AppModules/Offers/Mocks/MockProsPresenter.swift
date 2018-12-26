//
//  MockProsPresenter.swift
//  HomeAdvisorTests
//
//  Created by Jonnalagadda, Jak on 12/19/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import XCTest
@testable import HomeAdvisor

class MockProsPresenter: HAProsPresenting, HAProsInteractingOut {

    weak var view: HAProsViewing?
    var interactor: HAProsInteracting
    var router: HAProsRouting
    var availablePros: [HAPro] = []

    var setAllAvailableProsCalled = false
    var errorFindingProsCalled = false
    var loadAvailableProsCalled = false
    var selectedProCalled = false
    var expectationInTesting: XCTestExpectation?

    required init(view: HAProsViewing? = nil, interactor: HAProsInteracting, router: HAProsRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
        interactor.presenter = self
    }

    var proSections: Int = 1

    func proSectionCount(for section: Int) -> Int {
        return availablePros.count
    }

    func proInfo(for indexPath: IndexPath) -> HAProCellInfo {
        let pro = availablePros[indexPath.row]
        return HAProCellInfo(proName: pro.companyName,
                             proRating: "TestingRating",
                             proRatingColor: .red)
    }

    func selectedPro(at indexPath: IndexPath) {
        selectedProCalled = true
        expectationInTesting?.fulfill()
    }

    func loadAvailablePros() {
        interactor.getAllAvailableHAProsForCurrentUser()
        loadAvailableProsCalled = true
        expectationInTesting?.fulfill()
    }

    func setAllAvailableHAProsForCurrentUser(pros: [HAPro]) {
        availablePros = pros
        setAllAvailableProsCalled = true
        expectationInTesting?.fulfill()
    }

    func errorFindingHAPros() {
        errorFindingProsCalled = true
        expectationInTesting?.fulfill()
    }
}
