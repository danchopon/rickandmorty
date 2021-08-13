//
//  CharacterModel.swift
//  test
//
//  Created by Daniiar Erkinov on 12/8/21.
//

import Foundation

enum CharacterViewAction {
    case willDisplay(index: Int)
    case load
}

enum CharacterActivity {
    case loading
}

protocol CharacterModelInput: AnyObject {
    var itemsCount: Int { get }
    func character(at indexPath: IndexPath) -> CharacterDisplayable
    func perform(action: CharacterViewAction)
}

protocol CharacterModelOutput: AnyObject {
    func didStartActivity(_ activity: CharacterActivity)
    func didFinishActivity(_ activity: CharacterActivity)
    func didFinishActivity(_ activity: CharacterActivity, with error: Error)
}

class CharacterModel {
    weak var output: CharacterModelOutput!
    
    private let repository: CharactersRespository
    
    private var characters: [Character] = []
    private var page = 1
    private var endReached = false
        
    private var isLoading: Bool = false
    
    init(repository: CharactersRespository) {
        self.repository = repository
    }
    
    private func load() {
        guard !isLoading else {
            return
        }
        isLoading = true
        output.didStartActivity(.loading)
        repository.getCharacters(page: page) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.characters.append(contentsOf: response.results)
                self.endReached = response.info.count == self.characters.count
                self.output.didFinishActivity(.loading)
            case .failure(let error):
                self.output.didFinishActivity(.loading, with: error)
            }
        }
    }
    
    private func willDisplay(at index: Int) {
        guard !characters.isEmpty,
              index == characters.count - 3,
              !endReached else {
            return
        }
        page += 1
        load()
    }
}

extension CharacterModel: CharacterModelInput, CharacterViewControllerOutput {
    var itemsCount: Int {
        return characters.count
    }
    
    var shouldShowActivityIndicator: Bool {
        return isLoading
    }
    
    func character(at indexPath: IndexPath) -> CharacterDisplayable {
        return CharacterDisplayable(character: characters[indexPath.row])
    }
    
    func perform(action: CharacterViewAction) {
        switch action {
        case .willDisplay(let index):
            willDisplay(at: index)
        case .load:
            load()
        }
    }
    
}
