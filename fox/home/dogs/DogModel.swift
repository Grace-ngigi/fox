//
//  DogModel.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import Foundation

// MARK: - Dog
struct Dog: Codable {
    let message: [String: [String]]
    let status: String
}
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
