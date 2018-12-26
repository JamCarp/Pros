//
//  HAProsViewController.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import UIKit

/// Part of the HAPros Modudel and Displays the list of all the available modules.
class HAProsViewController: UITableViewController, HAProsViewing {

    var presenter: HAProsPresenting! {
        willSet {
            newValue.view = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.loadAvailablePros()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateAvailableHAPros()
    }
}

/// HAProsPresenter will call the function in the extension.
extension HAProsViewController  {
    func updateAvailableHAPros() {
        tableView.reloadData()
    }

    func showSomethingWentWrongAlert() {
    }
}

/// Datasounce for TableView
extension HAProsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.proSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.proSectionCount(for: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let proCell = tableView.dequeueReusableCell(withIdentifier: HAProCell.cellReuseIdentifier, for: indexPath) as? HAProCell {
            proCell.configureCell(with: presenter.proInfo(for: indexPath))
            return proCell
        } else {
            assertionFailure("HAProCell is not registered for reuse identifier: " + HAProCell.cellReuseIdentifier)
            let proCell = HAProCell(frame: .zero)
            proCell.configureCell(with: presenter.proInfo(for: indexPath))
            return proCell
        }
    }
}

/// Delegate for TableView
extension HAProsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedPro(at: indexPath)
    }
}
