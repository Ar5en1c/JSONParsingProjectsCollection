//
//  MealModel.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import Foundation

struct Menu: Codable {
    let meals: [Meal]?
}

struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let strInstructions: String
}
