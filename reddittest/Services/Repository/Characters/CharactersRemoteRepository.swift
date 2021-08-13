import Moya

final class CharactersRemoteRepository: CharactersRespository {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getCharacters(page: Int, completion: @escaping CharacterResponseCompletion) {
        networkManager.request(MultiTarget(CharacterAPI.character(page: page)), for: CharacterResponse.self, completion: completion)
    }
}
