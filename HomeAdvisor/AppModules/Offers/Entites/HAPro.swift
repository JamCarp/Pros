//
//  HAPro.swift
//  HomeAdvisor
//
//  Created by Jonnalagadda, Jak on 12/24/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import Foundation

///HAPro is created from the JSON file and passed between multiple modules.
struct HAPro: Codable, Hashable {
    let entityId: String
    let companyName: String
    let companyOverview: String
    let canadianSP: Bool
    let spanishSpeaking: Bool
    let servicesOffered: String?
    let specialty: String
    
    let primaryLocation: String
    let locationLatitude: Double?
    let locationLongitude: Double?

    let phoneNumber: String
    let email: String

    let ratingCount: Int
    let compositeRating: Double

    enum CodingKeys: String, CodingKey {
        case entityId          = "entityId"
        case companyName       = "companyName"
        case companyOverview   = "companyOverview"
        case canadianSP        = "canadianSP"
        case spanishSpeaking   = "spanishSpeaking"
        case servicesOffered   = "servicesOffered"
        case specialty         = "specialty"

        case primaryLocation   = "primaryLocation"
        case locationLatitude  = "latitude"
        case locationLongitude = "longitude"

        case phoneNumber       = "phoneNumber"
        case email             = "email"

        case ratingCount       = "ratingCount"
        case compositeRating   = "compositeRating"
    }
}

extension HAPro {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        entityId        = try values.decode(String.self, forKey: .entityId)
        companyName     = try values.decode(String.self, forKey: .companyName)
        companyOverview = try values.decode(String.self, forKey: .companyOverview)
        canadianSP      = try values.decode(Bool.self, forKey: .canadianSP)
        spanishSpeaking = try values.decode(Bool.self, forKey: .spanishSpeaking)
        servicesOffered = try? values.decode(String.self, forKey: .servicesOffered)
        specialty       = try values.decode(String.self, forKey: .specialty)

        primaryLocation   = try values.decode(String.self, forKey: .primaryLocation)
        locationLatitude  = try? values.decode(Double.self, forKey: .locationLatitude)
        locationLongitude = try? values.decode(Double.self, forKey: .locationLongitude)

        phoneNumber   = try values.decode(String.self, forKey: .phoneNumber)
        email         = try values.decode(String.self, forKey: .email)

        let ratingCountString = try values.decode(String.self, forKey: .ratingCount)
        ratingCount = Int(ratingCountString) ?? 0

        let compositeRatingString = try values.decode(String.self, forKey: .compositeRating)
        compositeRating = Double(compositeRatingString) ?? 0.0
    }
}

extension HAPro: Equatable {
    static func == (lhs: HAPro, rhs: HAPro) -> Bool {
        return lhs.entityId == rhs.entityId
    }
}

/*TODO: needs to be reviwed and removed. If HAPro entity gets complex or
  needed to pass back to APIs then only this will be useful.*/
/*
 extension CharterROI: Encodable {
     func encode(to encoder: Encoder) throws {
         var container = encoder.container(keyedBy: CodingKeys.self)

         try container.encode(id, forKey: .id)
         try container.encode(url, forKey: .url)
         try container.encode(name, forKey: .name)
         try container.encode(description, forKey: .description)
     }
 }*/
