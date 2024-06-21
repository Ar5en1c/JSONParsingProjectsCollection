//
//  Constants.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import Foundation

//MARK: Consants stored in one place for better management
enum Constants: String {
    case userInfoAPI = "https://jsonplaceholder.typicode.com/users"
    case actorInfoAPI = "https://swapi.py4e.com/api/people/1"
    case videoInfoAPI = "https://gist.githubusercontent.com/dbackeus/484315/raw/dfeb530f9619bb74af5d537280a0b3b305410d01/videos.json"
    case newsInfoAPI = "https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json"
    case mealsInfoAPI = "https://www.themealdb.com/api/json/v1/1/search.php?f=s"
    case artistCellName = "ITuneArtistNameCell"
    case nA = "N/A"
    case genre = "Genre"
    case country = "Country"
}


enum ErrorMessages: String {
    case errorImg = "person.crop.circle.badge.exclamationmark"
    case errorFetchMessage = "Failed to fetch data"
    case errorImgFetchMessage = "Failed to fetch Image"
    case noDataMessage = "No Data Available"
    case errorInSerializing = "Unable to convert serialized object to model"
}


enum FetchError: Error {
    case invalidURL
    case decodingFailed(Error)
}
