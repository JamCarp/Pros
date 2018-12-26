//
//  HAProDetailsRouter.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import UIKit

class HAProDetailsRouter: HAProDetailsRouting {
    /// Returns the new instance of the HAProDetails Module.
    static func proDetails(for selectedPro: HAPro) -> HAProDetailsViewing {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let proDetailsVC = storyboard.instantiateViewController(withIdentifier: "HAProDetails") as! HAProDetailsViewController
        proDetailsVC.presenter = HAProDetailsPresenter(interactor: HAProDetailsInteractor(),
                                                       router: HAProDetailsRouter(),
                                                       selectedPro: selectedPro)
        return proDetailsVC
    }
}
