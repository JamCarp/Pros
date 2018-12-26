//
//  AppDelegate.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeWindowWithRootVC()
        return true
    }

    private func initializeWindowWithRootVC() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let prosVC = HAProsRouter.prosModule
        window?.rootViewController = UINavigationController(rootViewController: prosVC)
        window?.makeKeyAndVisible()
    }
}

