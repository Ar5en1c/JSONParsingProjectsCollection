//
//  APIProtocols.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import Foundation

protocol UserDataDelegate: AnyObject {
    func didFetchUserData()
}


protocol ActorInfoDataDelegate: AnyObject {
    func didFetchActorInfo()
}


protocol VideosInfoDataDelegate: AnyObject {
    func didFetchVideosInfo()
}


protocol NewsInfoDataDelegate: AnyObject {
    func didFetchNewsInfo()
}


protocol MealsInfoDataDelegate: AnyObject {
    func didFetchMealsInfo()
}
