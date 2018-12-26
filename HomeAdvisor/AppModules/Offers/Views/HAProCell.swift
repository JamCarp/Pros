//
//  HAProCell.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import UIKit

///HAProCell is part of the HAPros module and display one of the all available HAPros.
class HAProCell: UITableViewCell {
    static let  cellReuseIdentifier = "HAProCell"

    @IBOutlet weak var proName: UILabel!
    @IBOutlet weak var proRating: UILabel!

    init(frame: CGRect) {
        super.init(style: .default, reuseIdentifier: HAProCell.cellReuseIdentifier)
        setupCellStyleAndAppearence()
        setupCellSubViewsAndConstraints()
    }

    func configureCell(with proCellInfo: HAProCellInfo) {
        proName.text = proCellInfo.proName
        proRating.text = proCellInfo.proRating
        proRating.textColor = proCellInfo.proRatingColor
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension HAProCell {
    /// Configures the entire HAProCell's Font, Color and other Style and Appearences.
    private func setupCellStyleAndAppearence() {
    }
    /// Configures the entire HAProCell's strecture with its subviews.
    private func setupCellSubViewsAndConstraints() {
        //Setting AutoresizingMask to false so we can use VFL.
    }
}
