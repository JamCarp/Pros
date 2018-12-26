//
//  HAProsRouter.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import UIKit

class HAProsRouter: HAProsRouting {
    ///Initiates and return a new Pros Module.
    static var prosModule: HAProsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let haProsVC = storyboard.instantiateViewController(withIdentifier: "HAPros") as! HAProsViewController
        haProsVC.presenter = HAProsPresenter(interactor: HAProsInteractor(),
                                             router: HAProsRouter())
        return haProsVC
    }

    ///Presents the Pro Details Module for the selected Pro.
    func showProDetails(for pro: HAPro, from view: HAProsViewing?) {
        if let HAProsVC = view as? HAProsViewController,
            let HAProDetailsVC = HAProDetailsRouter.proDetails(for: pro) as? HAProDetailsViewController {
            HAProsVC.navigationController?.show(HAProDetailsVC, sender: nil)
        }
    }
}
