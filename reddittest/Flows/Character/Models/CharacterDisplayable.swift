//
//  CharacterDisplayable.swift
//  test
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import UIKit

struct CharacterDisplayable {
    let character: Character
    
    var characterName: String {
        return character.name
    }
    
    var statusImage: UIImage? {
        return character.status.image
    }
    
    var statusText: String {
        return character.status.rawValue
    }
    
    var race: String {
        return character.species ?? "undefined"
    }
    
    var imageURL: URL? {
        return URL(string: character.image)
    }
}
