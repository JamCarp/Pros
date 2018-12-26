//
//  HAProsPresenter.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import UIKit

/// Part of the HAPros Modudel and presents the list of all the available modules.
class HAProsPresenter: HAProsPresenting {
    
    weak var view: HAProsViewing?
    var interactor: HAProsInteracting
    var router: HAProsRouting
    var availablePros: [HAPro] = []
    
    required init(view: HAProsViewing? = nil, interactor: HAProsInteracting, router: HAProsRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
        interactor.presenter = self
    }
    
    //Data source for the HAPros module.
    var proSections: Int = 1
    
    func proSectionCount(for section: Int) -> Int {
        return availablePros.count
    }
    
    func proInfo(for indexPath: IndexPath) -> HAProCellInfo {
        let pro = availablePros[indexPath.row]
        var proRating: String
        var proRatingColor = UIColor.haBlack
        
        if pro.ratingCount > 0 {
            proRating = HAUserStrings.ProInfoCell.rating + " \(pro.compositeRating)"
            proRating += " | " + "\(pro.ratingCount) " + HAUserStrings.ProInfoCell.ratingCount
            switch pro.compositeRating {
            case 0..<3: proRatingColor = .haRed
            case 3..<4: proRatingColor = .haOrange
            case 4...5: proRatingColor = .haGreen
            default: break
            }
        } else {
            proRating = HAUserStrings.ProInfoCell.referencesAvailable
        }
        
        return HAProCellInfo(proName: pro.companyName,
                             proRating: proRating,
                             proRatingColor: proRatingColor)
    }
    
    //Delegate for the HAPros module.
    func selectedPro(at indexPath: IndexPath) {
        let selectedPro = availablePros[indexPath.row]
        router.showProDetails(for: selectedPro, from: view)
    }
    
    //Loads the HAPros for during the launch and whenever required.
    func loadAvailablePros() {
        interactor.getAllAvailableHAProsForCurrentUser()
    }
}

/// Contracts with the ProsInteractor to get the list of all the available Pros.
extension HAProsPresenter: HAProsInteractingOut {
    func setAllAvailableHAProsForCurrentUser(pros: [HAPro]) {
        availablePros = pros
        DispatchQueue.main.async {
            self.view?.updateAvailableHAPros()
        }
    }
    
    func errorFindingHAPros() {
        DispatchQueue.main.async {
            self.view?.showSomethingWentWrongAlert()
        }
    }
}
