//
//  APIProtocols.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import Foundation

// MARK: Protocol delegate for User View Model
protocol UserDataDelegate: AnyObject {
    func didFetchUserData()
}

// MARK: Protocol delegate for Actor View Model
protocol ActorInfoDataDelegate: AnyObject {
    func didFetchActorInfo()
}

// MARK: Protocol delegate for Video View Model
protocol VideosInfoDataDelegate: AnyObject {
    func didFetchVideosInfo()
}

// MARK: Protocol delegate for NewsFeed View Model
protocol NewsInfoDataDelegate: AnyObject {
    func didFetchNewsInfo()
}

// MARK: Protocol delegate for Meals View Model
protocol MealsInfoDataDelegate: AnyObject {
    func didFetchMealsInfo()
}
