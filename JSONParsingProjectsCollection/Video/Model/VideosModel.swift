//
//  VideosModel.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import Foundation


struct VideosModel: Codable {
    let title: String
    let created_at: String
    let transcodings: [Transcoding]
}

struct Transcoding: Codable {
    let id: String
    let title: String
    let height: Int
}
