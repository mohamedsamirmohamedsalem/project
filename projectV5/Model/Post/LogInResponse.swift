//
//  LogInResponse.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/23/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct LogInResponse: Codable {
    let status: Int?
    let api_token: String?
    let message : String?
    let user: UserLogin?
    
    
    enum CodingKeys: String, CodingKey {
        case status
        case api_token
        case message
        case user
    }
}

// MARK: - User
struct UserLogin: Codable {
    let id: Int?
    let name, email, city, address: String?
    let phoneNumber: String?
    let shippingAddress: String?
    let roleID: Int?
    let type, createdAt, updatedAt: String?
    let isAvailable: Int?
    let client: Client?
    let driverInfo: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, email, city, address
        case phoneNumber
        case shippingAddress
        case roleID
        case type
        case createdAt
        case updatedAt
        case isAvailable
        case client
        case driverInfo
    }
}

// MARK: - Client
struct Client: Codable {
    let id, userID, countryID: Int?
    let regionID: Int?
    let city: String?
    let zipCode: Int?
    let address, phoneNumber: String?
    let image: String?
    let lat, lng: Double?
    let createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID
        case countryID
        case regionID
        case city
        case zipCode
        case address
        case phoneNumber
        case image, lat, lng
        case createdAt
        case updatedAt
    }
}
