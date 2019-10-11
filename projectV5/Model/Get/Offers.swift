//
//  Offers.swift
//  projectV5
//
//  Created by Mohamed Samir on 10/11/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import Foundation

// MARK: - WelcomeElement
struct Offers : Codable {
    let id, providerID: Int?
   // let parentID: NSNull?
    let sku, url: String?
   // let brandID: NSNull?
    let type: String?
   // let featureSetID: NSNull?
    let checkav, position, isFeatured, isLatest: Int?
    let views: Int?
    let createdAt, updatedAt, title, welcomeDescription: String?
    let shortDescription: String?
    let isAvailable, oldPrice, currentPrice, stock: Int?
    let image: String?
   // let featureValues: [Any?]?
    let mainImage, images: [Image]?
}

// MARK: - Image
struct Image : Codable {
    let id, productID: Int?
    let image: String?
    let status: Int?
    let createdAt, updatedAt: String?
}

