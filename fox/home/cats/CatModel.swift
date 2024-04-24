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
    let temperament, origin: String
    let description, lifeSpan: String
    let adaptability, affectionLevel, childFriendly, dogFriendly: Int
    let hypoallergenic: Int

    enum CodingKeys: String, CodingKey {
        case weight, id, name
        case temperament, origin
        case description
        case lifeSpan = "life_span"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case hypoallergenic
    }
}

// MARK: - Weight
struct Weight: Codable {
    let imperial, metric: String
}
