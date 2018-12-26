//
//  HAProDetailsContract.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import Foundation

///Implemented by HAProDetailsViewController, contract for HAProDetailsPresenter.
protocol HAProDetailsViewing: AnyObject {
    /// Notifies the View when there are new ProDetails available.
    func updateHAProDetails(with proDetails: HAProDetails)
    /// Notifies the View when ProDetails loading is failed.
    func showSomethingWentWrongAlert()
}

///Implemented by HAProDetailsPresenter, contract for HAProDetailsView.
protocol HAProDetailsPresenting: AnyObject {
    var view: HAProDetailsViewing? { get set }
    var interactor: HAProDetailsInteracting { get }
    var router: HAProDetailsRouting { get }

    // Pro selected by User
    var selectedPro: HAPro { get }

    init(view: HAProDetailsViewing?,
         interactor: HAProDetailsInteracting,
         router: HAProDetailsRouting,
         selectedPro: HAPro)

    ///Favorites and Unfavorites the Pro.
    func updateHAProstatus()

    ///Notifies to load a specific kind of HAProDetails.
    func loadHAProDetails()

    /// Calls the HA Pro if calling is available on the device.
    func callHAPro()
    /// Emails the HA Pro if Emailing is available on the device.
    func emailHAPro()
}

///Implemented by HAProDetailsInteractor, contract for HAProDetailsPresenter.
protocol HAProDetailsInteracting: AnyObject {
    var presenter: HAProDetailsInteractingOut? { get set }
}

///Implemented by HAProDetailsPresenter, contract for HAProDetailsInteractor.
protocol HAProDetailsInteractingOut: AnyObject {
}

///Implemented by HAProDetailsRouter to Create HAProDetails Module.
protocol HAProDetailsRouting: AnyObject {
    /// Returns the new instance of the HAProDetails Module.
    static func proDetails(for selectedPro: HAPro) -> HAProDetailsViewing
}

