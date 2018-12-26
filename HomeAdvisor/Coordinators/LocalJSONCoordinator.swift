//
//  LocalJSONCoordinator.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import UIKit

class LocalJSONCoordinator {
    static let shared = LocalJSONCoordinator()

    private let HAProsFileName = "pro_data"
    private let HAProsFileType = "json"

    /// ProsError will represent the error while
    /// `finding`, `reading` and `parsing` the `pro_data.json`,
    enum ProsError {
        case fileNotFound
        case fileReading
        case parsing
    }

    /// Returns an array containing the all the Pros from the JSON file.
    ///
    /// In this example, `getHAProsfromHAProsJsonFile` is used to convert
    /// the pro_data.json to an array of `HAPro`.
    ///
    ///     self.getHAProsfromHAProsJsonFile(onSuccess: {pros in
    ///     }, onFailure: {[weak self] error in
    ///     })
    /// - Parameters:
    ///     - success: Closure to be exected on success with all available HAPros.
    ///     - failure: Closure to be exected on failure with ProsError.
    /// - Author: Jak Jonnalagadda
    /// - Version: 0.1
    func getHAProsfromHAProsJsonFile(onSuccess success: ([HAPro]) -> (Void), onFailure failure: (ProsError)->(Void)) {
        if let prosJsonFileURL = Bundle.main.url(forResource: self.HAProsFileName, withExtension: self.HAProsFileType) {
            do {
                let HAProsJsonData = try Data(contentsOf: prosJsonFileURL)
                do {
                    let decoder = JSONDecoder()
                    let HAPros = try decoder.decode([HAPro].self, from: HAProsJsonData)
                    success(HAPros)
                } catch {
                    failure(.parsing)
                }
            }  catch {
                failure(.fileReading)
            }
        } else {
            failure(.fileNotFound)
        }
    }
}
