//
//  getCategories.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/26/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//
import Foundation

// MARK: - WelcomeElement
struct Categories: Codable {
    let id: Int?
    let parentID: Int?
    let name, type: String?
    let isActive, includeInMenu, displayProducts, level: Int?
    let sortOrder: Int?
    let createdAt, updatedAt: String?
    let childrenCount: Int?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case parentID
        case name, type
        case isActive
        case includeInMenu
        case displayProducts
        case level
        case sortOrder
        case createdAt
        case updatedAt
        case childrenCount
        case image
    }

}

