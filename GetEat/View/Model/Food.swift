//
//  Food.swift
//  GetEat
//
//  Created by Bruno Silva on 14/06/21.
//

import Foundation

struct Food: Codable {
    
    //MARK: - Properties
    let id, name, welcomeDescription: String?
    let ingredients: [Ingredient]
    let imageURL: String?
    let createdAt, updatedAt: String?
    let v: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case welcomeDescription = "description"
        case ingredients
        case imageURL = "image_url"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let name: String?
    let quantity: Int?
    let unitMeasurement: String?
}
