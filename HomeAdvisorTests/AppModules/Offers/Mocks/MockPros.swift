//
//  MockPros.swift
//  HomeAdvisorTests
//
//  Created by Jonnalagadda, Jak on 12/21/18.
//  Copyright © 2018 Jonnalagadda, Jak. All rights reserved.
//

import Foundation
@testable import HomeAdvisor

struct MockPros {
    static let firstPro = HAPro(entityId: "1222893113",
                                companyName: "Summit Preservation, LLC",
                                companyOverview: "Summit Preservation prides itself on creating beautiful surfaces for your home. You can always expect a great experience with us, a reasonable rate and a quality finish to the job. Call us today!",
                                canadianSP: false,
                                spanishSpeaking: false,
                                servicesOffered: "Flooring & Carpet, Tile",
                                specialty: "Additions & Remodeling",
                                primaryLocation: "Henderson, CO",
                                locationLatitude: 39.8873,
                                locationLongitude: -104.8805,
                                phoneNumber: "(330) 555-3136",
                                email: "contact@summitpresllc.biz",
                                ratingCount: 7,
                                compositeRating: 5.0)

    static let proWithOutRatings = HAPro(entityId: "5803803218",
                                         companyName: "The Worm Drain Cleaning",
                                         companyOverview: "We have over 20 years of experience in the business. Here at The Worm Drain Cleaning, we pride our company on reliability, great communication, integrity, and quality work. We are experts in our trade, and will do our best to keep you as educated as we can on your particular task or project. We look forward to earning your business!",
                                         canadianSP: false,
                                         spanishSpeaking: false,
                                         servicesOffered: "Flooring & Carpet, Tile",
                                         specialty: "Plumbing",
                                         primaryLocation: "Commerce City, CO",
                                         locationLatitude: nil,
                                         locationLongitude: nil,
                                         phoneNumber: "(720) 555-7078",
                                         email: "contact@theworm.biz",
                                         ratingCount: 0,
                                         compositeRating: 0.0)

    static let proWithOutServices = HAPro(entityId: "5803803218",
                                          companyName: "The Worm Drain Cleaning",
                                          companyOverview: "We have over 20 years of experience in the business. Here at The Worm Drain Cleaning, we pride our company on reliability, great communication, integrity, and quality work. We are experts in our trade, and will do our best to keep you as educated as we can on your particular task or project. We look forward to earning your business!",
                                          canadianSP: false,
                                          spanishSpeaking: false,
                                          servicesOffered: nil,
                                          specialty: "Plumbing",
                                          primaryLocation: "Commerce City, CO",
                                          locationLatitude: nil,
                                          locationLongitude: nil,
                                          phoneNumber: "(720) 555-7078",
                                          email: "contact@theworm.biz",
                                          ratingCount: 0,
                                          compositeRating: 0.0)

    static let lastPro = HAPro(entityId: "4541281426",
                               companyName: "Total Maintenance",
                               companyOverview: "Hello. I offer full service handyman projects, including washer , dryer and refrigerator repair. I will also do various handyman projects for residential and commercial settings.  Please call me for a free estimate. ",
                               canadianSP: false,
                               spanishSpeaking: false,
                               servicesOffered: "Air Conditioning, Appliances, Drywall  & Plaster, Handyman Services, Plumbing",
                               specialty: "Handyman Services",
                               primaryLocation: "Atlanta, GA",
                               locationLatitude: 33.7062,
                               locationLongitude: -84.5492,
                               phoneNumber: "(404) 555-3302",
                               email: "contact@totalmaint.biz",
                               ratingCount: 10,
                               compositeRating: 4.28)
}
