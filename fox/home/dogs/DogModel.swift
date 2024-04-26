//
//  DogModel.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import Foundation

struct DogModel: Codable {
    let weight, height: Eight
    let name: String
    let imageRefId: String
    let lifeSpan: String
    let bredFor: String?
    let temperament: String?
    let countryCode: CountryCode?
    let description, history: String?

    enum CodingKeys: String, CodingKey {
        case weight, height, name, temperament
        case lifeSpan = "life_span"
        case bredFor = "bred_for"
        case countryCode = "country_code"
        case imageRefId = "reference_image_id"
        case description, history
    }
}

enum BreedGroup: String, Codable {
    case empty = ""
    case herding = "Herding"
    case hound = "Hound"
    case mixed = "Mixed"
    case nonSporting = "Non-Sporting"
    case sporting = "Sporting"
    case terrier = "Terrier"
    case toy = "Toy"
    case working = "Working"
}

enum CountryCode: String, Codable {
    case ag = "AG"
    case au = "AU"
    case us = "US"
}

// MARK: - Eight
struct Eight: Codable {
    let imperial, metric: String
}
