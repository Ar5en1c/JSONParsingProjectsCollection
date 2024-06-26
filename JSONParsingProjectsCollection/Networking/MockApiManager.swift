//
//  MockApiManager.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/24/24.
//
import Foundation

class MockAPIManager: APIManager {

    override func fetchDataAsJSON<T: Decodable>(url: String) async throws -> T {
            switch url {
            case Constants.userInfoAPI.rawValue:
                return MockData.users as! T
            case Constants.actorInfoAPI.rawValue:
                return MockData.actorInfo as! T
            case Constants.videoInfoAPI.rawValue:
                return MockData.videosModel as! T
            case Constants.newsInfoAPI.rawValue:
                return MockData.newsResponse as! T
            case Constants.mealsInfoAPI.rawValue:
                return MockData.menu as! T
            default:
                throw FetchError.invalidURL
            }
        }
}
