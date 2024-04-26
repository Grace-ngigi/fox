//
//  CatModel.swift
//  fox
//
//  Created by Gracie on 24/04/2024.
//

import Foundation

// MARK: - WelcomeElement
struct CatModel: Codable {
    let weight: Weight
    let id, name: String
    let temperament, origin, description, lifeSpan: String
    let adaptability, affectionLevel, childFriendly, dogFriendly: Int
    var energyLevel, grooming, healthIssues, intelligence: Int
    var sheddingLevel, socialNeeds, strangerFriendly, vocalisation, experimental: Int

    enum CodingKeys: String, CodingKey {
        case weight, id, name
        case temperament, origin
        case description
        case lifeSpan = "life_span"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation, experimental
    }
}

// MARK: - Weight
struct Weight: Codable {
    let imperial, metric: String
}


struct ImageRef: Codable {
    let id: String
    let url: String
    let width, height: Int
}

