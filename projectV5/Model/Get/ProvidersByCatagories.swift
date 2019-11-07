//
//  File.swift
//  projectV5
//
//  Created by Mohamed Samir on 10/11/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//
import Foundation

// MARK: - WelcomeElement
struct ProvidersByCatagories : Codable {
    let id, categoryID: Int?
    let image: String?
    let fees: Int?
    let lat, lng: String?
    let rate, isActive: Int?
    let name, catName: String?
    let reviews: [Review]?
}

// MARK: - Review
struct Review : Codable{
    let id, clientID, providerID: Int?
    let rate: Double?
    let review: String?
    let isApproved: Int?
    let createdAt, updatedAt: String?
}
