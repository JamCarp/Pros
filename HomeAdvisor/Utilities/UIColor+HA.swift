//
//  UIColor+HomeAdvisor.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import UIKit

/// extension contains the custom colors used in the HA Pros App.
/// All the colors are defined in `Assets.xcassets`
extension UIColor {

    /// HomeAdvisor App's custom black color.
    static var haBlack: UIColor {
        return UIColor(named: "haBlack") ?? UIColor(red: 65 / 255,
                                                    green: 65 / 255,
                                                    blue: 65 / 255,
                                                    alpha: 1)
    }

    /// HomeAdvisor App's custom green color.
    static var haGreen: UIColor {
        return UIColor(named: "haGreen") ?? UIColor(red: 60 / 255,
                                                    green: 255 / 255,
                                                    blue: 85 / 255,
                                                    alpha: 1)
    }

    /// HomeAdvisor App's custom orange color.
    static var haOrange: UIColor {
        return UIColor(named: "haOrange") ?? UIColor(red: 247 / 255,
                                                    green: 144 / 255,
                                                    blue: 30 / 255,
                                                    alpha: 1)
    }

    /// HomeAdvisor App's custom red color.
    static var haRed: UIColor {
        return UIColor(named: "haRed") ?? UIColor(red: 255 / 255,
                                                  green: 79 / 255,
                                                  blue: 68 / 255,
                                                  alpha: 1)
    }
    
}
