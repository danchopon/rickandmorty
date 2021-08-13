protocol CharactersRespository {
    typealias CharacterResponseCompletion = ((Result<CharacterResponse, NetworkError>) -> Void)
    
    func getCharacters(page: Int, completion: @escaping CharacterResponseCompletion)
}
