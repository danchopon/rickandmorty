//
//  Character.swift
//  test
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import Foundation

// MARK: - Result
struct Character: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: String?
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
