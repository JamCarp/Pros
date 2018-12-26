//
//  HAProDetailsViewController.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import UIKit

class HAProDetailsViewController: UIViewController, HAProDetailsViewing {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var servicesLabel: UILabel!

    @IBOutlet weak var overviewTextView: UITextView!

    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!

    var presenter: HAProDetailsPresenting! {
        willSet {
            newValue.view = self
        }
    }

    override func loadView() {
        super.loadView()
        setupViewStyleAndAppearence()
        setupCellSubViewsAndConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.loadHAProDetails()
    }
}

extension HAProDetailsViewController {
    /// Configures the entire ProDetailsView's Font, Color and other Style and Appearences.
    private func setupViewStyleAndAppearence() {
    }

    /// Configures the entire ProDetailsView's strecture with its subviews.
    private func setupCellSubViewsAndConstraints() {
    }
}

extension HAProDetailsViewController {
    @IBAction func callButtonClicked(_ sender: UIButton) {
        presenter.callHAPro()
    }
    @IBAction func emailButtonClicked(_ sender: UIButton) {
        presenter.emailHAPro()
    }
}

/// HAProDetails Presenter will call the function in the extension.
extension HAProDetailsViewController {
    func updateHAProDetails(with proDetails: HAProDetails) {
        nameLabel.text = proDetails.proName
        specialityLabel.text = proDetails.proSpeciality
        ratingsLabel.text = proDetails.proRating

        locationLabel.text = proDetails.proPrimaryLocation
        servicesLabel.text = proDetails.proServicesOffered

        overviewTextView.text = proDetails.proCompanyOverview
    }

    func showSomethingWentWrongAlert() {
    }
}
