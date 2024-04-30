//
//  FoxViewModel.swift
//  fox
//
//  Created by Gracie on 29/04/2024.
//

import UIKit

struct FoxViewModel: Codable {
    var id: String
    var breed: String
    var description: String
    var weight: String
    var lifespan: String
    var randFact: String
    var image: String = "some image"
}
