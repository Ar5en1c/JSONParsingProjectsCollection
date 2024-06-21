//
//  UserModel.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import Foundation

// Structure for Geo
struct Geo: Codable {
    let lat: String
    let lng: String
}

// Structure for Address
struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

// Structure for Company
struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

// Structure for User
struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}
