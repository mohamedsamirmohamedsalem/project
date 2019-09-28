//
//  RegisterResponse.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/22/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//
import Foundation

// MARK: - Welcome
struct RegisterResponse: Codable {
    let status: Int?
    let apiToken: String?
    let message : String?
    let user: User?
    
    enum CodingKeys: String, CodingKey {
        case status
        case apiToken
        case message
        case user
    }
}

// MARK: - User
struct User: Codable {
    let name, email, phoneNumber, type: String?
    let updatedAt, createdAt: String?
    let id, isAvailable: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, email
        case phoneNumber
        case type
        case updatedAt
        case createdAt
        case id
        case isAvailable
    }
}
