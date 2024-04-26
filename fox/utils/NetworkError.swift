//
//  NetworrkError.swift
//  fox
//
//  Created by Gracie on 20/04/2024.
//

import Foundation
enum NetworkError: Error {
    case invalidURL
    case serverError
    case decodingError
}
