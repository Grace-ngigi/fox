//
//  DogModel.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct DogModel: Codable {
    let weight, height: Eight
    let id: Int
    let name: String
//    let bredFor: String?
//    let breedGroup: BreedGroup?
    let lifeSpan: String
//    let temperament, origin: String?
//    let referenceImageID: String
    let countryCode: CountryCode?
    let description, history: String?

    enum CodingKeys: String, CodingKey {
        case weight, height, id, name
//        case bredFor = "bred_for"
//        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
//        case temperament, origin
//        case referenceImageID = "reference_image_id"
        case countryCode = "country_code"
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

//typealias Welcome = [Dog]




//
//// MARK: - WelcomeElement
//struct Dog: Codable {
//    let weight: Weight
//    let id, name: String
//    let cfaURL: String
//    let vetstreetURL: String
//    let vcahospitalsURL: String
//    let temperament, origin, countryCodes, countryCode: String
//    let description, lifeSpan: String
//    let indoor, lap: Int
//    let altNames: String
//    let adaptability, affectionLevel, childFriendly, dogFriendly: Int
//    let energyLevel, grooming, healthIssues, intelligence: Int
//    let sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int
//    let experimental, hairless, natural, rare: Int
//    let rex, suppressedTail, shortLegs: Int
//    let wikipediaURL: String
//    let hypoallergenic: Int
//    let referenceImageID: String
//
//    enum CodingKeys: String, CodingKey {
//        case weight, id, name
//        case cfaURL = "cfa_url"
//        case vetstreetURL = "vetstreet_url"
//        case vcahospitalsURL = "vcahospitals_url"
//        case temperament, origin
//        case countryCodes = "country_codes"
//        case countryCode = "country_code"
//        case description
//        case lifeSpan = "life_span"
//        case indoor, lap
//        case altNames = "alt_names"
//        case adaptability
//        case affectionLevel = "affection_level"
//        case childFriendly = "child_friendly"
//        case dogFriendly = "dog_friendly"
//        case energyLevel = "energy_level"
//        case grooming
//        case healthIssues = "health_issues"
//        case intelligence
//        case sheddingLevel = "shedding_level"
//        case socialNeeds = "social_needs"
//        case strangerFriendly = "stranger_friendly"
//        case vocalisation, experimental, hairless, natural, rare, rex
//        case suppressedTail = "suppressed_tail"
//        case shortLegs = "short_legs"
//        case wikipediaURL = "wikipedia_url"
//        case hypoallergenic
//        case referenceImageID = "reference_image_id"
//    }
//}
//
//// MARK: - Weight
//struct Weight: Codable {
//    let imperial, metric: String
//}


//typealias Welcome = [WelcomeElement]

//// MARK: - Dog
//struct Dog: Codable {
//    let message: [String: [String]]
//    let status: String
//}
//struct Dog: Codable {
//    let data: [Datum]
//    let links: Links
//}
//
//// MARK: - Datum
//struct Datum: Codable {
//    let id, type: String
//    let attributes: Attributes
//}
//
//// MARK: - Attributes
//struct Attributes: Codable {
//    let name, description: String
//    let hypoallergenic: Bool
//}
//
//// MARK: - Links
//struct Links: Codable {
//    let linksSelf, current, next, last: String
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//        case current, next, last
//    }
//}
