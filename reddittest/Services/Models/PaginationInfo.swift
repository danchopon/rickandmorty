//
//  PaginationInfo.swift
//  test
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import Foundation

struct PaginationInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}
