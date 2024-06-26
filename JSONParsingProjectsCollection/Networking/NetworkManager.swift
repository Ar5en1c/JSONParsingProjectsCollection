//
//  NetworkManager.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/24/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    var isOnline: Bool = true
}
