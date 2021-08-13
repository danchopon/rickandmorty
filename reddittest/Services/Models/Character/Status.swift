//
//  Status.swift
//  test
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import UIKit

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    static let statusImage = UIImage(named: "status_dot")
    
    var image: UIImage? {
        switch self {
        case .alive:
            return Status.statusImage?.withTintColor(.green, renderingMode: .alwaysOriginal)
        case .dead:
            return Status.statusImage?.withTintColor(.red, renderingMode: .alwaysOriginal)
        case .unknown:
            return Status.statusImage?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        }
    }
}
