//
//  MockData.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/24/24.
//

import Foundation

struct MockData {

    static let users: [User] = [
        User(id: 1, name: "John Doe", username: "johndoe", email: "john.doe@example.com", address: Address(street: "Some Street", suite: "Suite 123", city: "New York", zipcode: "10001", geo: Geo(lat: "40.7128", lng: "-74.0060")), phone: "1-234-567-8901", website: "johndoe.com", company: Company(name: "ABC Company", catchPhrase: "We do stuff", bs: "Synergy")),
        User(id: 2, name: "Jane Smith", username: "janesmith", email: "jane.smith@example.com", address: Address(street: "Another Street", suite: "Apt. 456", city: "Los Angeles", zipcode: "90001", geo: Geo(lat: "34.0522", lng: "-118.2437")), phone: "1-213-555-1212", website: "janesmith.net", company: Company(name: "XYZ Corp", catchPhrase: "Making things happen", bs: "Disruptive innovation"))
    ]

    static let actorInfo: ActorInfo = ActorInfo(name: "John Doe", height: "180cm", birth_year: "1980", gender: "Male", created: "2023-01-01T12:00:00Z")

    static let videosModel: [VideosModel] = [VideosModel(title: "Sample Video", created_at: "2023-06-25T10:00:00Z", transcodings: [
        Transcoding(id: "1", title: "1080p", height: 1080),
        Transcoding(id: "2", title: "720p", height: 720),
        Transcoding(id: "3", title: "480p", height: 480)
    ])]
    
    static let newsResponse: NewsResponse = NewsResponse(status: "ok", totalResults: 1, articles: [
        Article(source: Source(id: "bbc-news", name: "BBC News"), author: "John Smith", title: "Breaking News: Something Happened!", description: "This is a breaking news story about something that happened.", url: "https://www.bbc.com/news/world-12345678", urlToImage: "https://example.com/image.jpg", publishedAt: "2023-06-25T11:00:00Z", content: "Lorem ipsum dolor sit amet...")
    ])

    static let menu: Menu = Menu(meals: [
        Meal(strMeal: "Spaghetti Carbonara", strMealThumb: "https://example.com/spaghetti.jpg", strInstructions: "Cook spaghetti. Fry pancetta. Mix eggs, cheese, pepper. Combine. Enjoy!")
    ])
}
