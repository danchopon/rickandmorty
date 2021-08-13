//
//  CharacterResponse.swift
//  test
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import Foundation

struct CharacterResponse: Codable {
    let info: PaginationInfo
    let results: [Character]
}
