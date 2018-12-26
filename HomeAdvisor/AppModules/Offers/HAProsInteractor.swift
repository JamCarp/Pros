//
//  HAProsInteractor.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import Foundation

class HAProsInteractor: HAProsInteracting {

    weak var presenter: HAProsInteractingOut?

    func getAllAvailableHAProsForCurrentUser() {
        DispatchQueue.global(qos: .background).async {
            LocalJSONCoordinator.shared.getHAProsfromHAProsJsonFile(onSuccess: {[weak self] pros in
                if let sortedPros = self?.sortedProsForCurrentUser(pros) {
                    self?.presenter?.setAllAvailableHAProsForCurrentUser(pros: sortedPros)
                }
            }, onFailure: {[weak self] error in
                self?.presenter?.errorFindingHAPros()
            })
        }
    }

    private func sortedProsForCurrentUser(_ pros: [HAPro]) -> [HAPro] {
        return pros.sorted { $0.companyName < $1.companyName }
    }
}
