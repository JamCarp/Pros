//
//  HAProDetailsPresenter.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import Foundation

class HAProDetailsPresenter: HAProDetailsPresenting, HAProDetailsInteractingOut {
    weak var view: HAProDetailsViewing?
    var interactor: HAProDetailsInteracting
    var router: HAProDetailsRouting
    var selectedPro: HAPro

    required init(view: HAProDetailsViewing? = nil, interactor: HAProDetailsInteracting, router: HAProDetailsRouting, selectedPro: HAPro) {
        self.selectedPro = selectedPro
        self.view = view
        self.interactor = interactor
        self.router = router
        interactor.presenter = self
    }

    func updateHAProstatus() {
        
    }

    func loadHAProDetails() {

        var proRating: String
        if selectedPro.ratingCount > 0 {
            proRating = HAUserStrings.ProInfoCell.rating + " \(selectedPro.compositeRating)"
            proRating += " | " + "\(selectedPro.ratingCount) " + HAUserStrings.ProInfoCell.ratingCount

        } else {
            proRating = HAUserStrings.ProInfoCell.referencesAvailable
        }

        let proServices = selectedPro.servicesOffered ?? HAUserStrings.ProDetails.servicesNotAvailable

        let proDetails = HAProDetails(proName:selectedPro.companyName,
                                      proSpeciality: selectedPro.specialty,
                                      proRating: proRating,
                                      proPrimaryLocation: selectedPro.primaryLocation,
                                      proServicesOffered: proServices,
                                      proCompanyOverview: selectedPro.companyOverview)
        view?.updateHAProDetails(with: proDetails)
    }

    /// Calls the HA Pro if calling is available on the device.
    func callHAPro() {
        print("Phone = " + selectedPro.phoneNumber)
    }

    /// Emails the HA Pro if Emailing is available on the device.
    func emailHAPro() {
        print("Email = " + selectedPro.email)
    }
}


/// Contracts with the Pro Details Interactor to get the list of all the available HAPros.
extension HAProsPresenter: HAProDetailsInteractingOut {
}
