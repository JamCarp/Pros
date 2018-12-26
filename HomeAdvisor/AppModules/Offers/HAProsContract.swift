//
//  HAProsContract.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import Foundation

///Implemented by HAProsViewController, contract for HAProsPresenter.
protocol HAProsViewing: AnyObject {
    /// Presenter for Pros Module.
    var presenter: HAProsPresenting! { get set }
    /// Notifies the View when there are new Pros available.
    func updateAvailableHAPros()
    /// Notifies the View when Pros loading is failed.
    func showSomethingWentWrongAlert()
}

///Implemented by HAProsPresenter, contract for HAProsView.
protocol HAProsPresenting: AnyObject {
    var view: HAProsViewing? { get set }
    var interactor: HAProsInteracting { get }
    var router: HAProsRouting { get }

    /// Initializes the Presenter along with all the required components
    /// including Interactor and Router.
    ///
    /// In this example, `init` creates presenter for Pros Module.
    ///
    ///     let presenter = HAProsPresenter(interactor: HAProsInteractor(),
    ///                                     router: HAProsRouter())
    ///
    /// - Parameters:
    ///     - view: view for Pros Module (of type: HAProsViewing).
    ///     - interactor: interactor for Pros Module (of type: HAProsInteracting).
    ///     - router: router for Pros Module (of type: HAProsRouting).
    /// - Returns: Presenter for Pros Module.
    init(view: HAProsViewing?, interactor: HAProsInteracting, router: HAProsRouting)

    /// List of available Pros found for the current user.
    var availablePros: [HAPro] { get }

    // Data Source for View.
    var proSections: Int { get }
    func proSectionCount(for section: Int) -> Int
    func proInfo(for indexPath: IndexPath) -> HAProCellInfo

    /// Notifies when user selects a Pro.
    func selectedPro(at indexPath: IndexPath)

    /// Notifies to load a specific kind of HAPros.
    func loadAvailablePros()
}

/// Implemented by HAProsInteractor, contract for HAProsPresenter.
protocol HAProsInteracting: AnyObject {
    var presenter: HAProsInteractingOut? { get set }
    /// Loads the available Pros for the current user.
    func getAllAvailableHAProsForCurrentUser()
}

///Implemented by HAProsPresenter, contract for HAProsInteractor.
protocol HAProsInteractingOut: AnyObject {
    /// Notifies the presenter when Pros available for current user.
    func setAllAvailableHAProsForCurrentUser(pros: [HAPro])
    /// Notifies the presenter when an error occurs while loading Pros.
    func errorFindingHAPros()
}

///Implemented by HAProsRouter to Create HAPros Module.
protocol HAProsRouting: AnyObject {
    /// Navigates the user to the selected Pro.
    func showProDetails(for pro: HAPro, from view: HAProsViewing?)
}
