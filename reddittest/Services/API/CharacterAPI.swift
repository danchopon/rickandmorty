import Moya

enum CharacterAPI {
    case character(page: Int)
}

extension CharacterAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://rickandmortyapi.com/api")!
    }
    
    var path: String {
        switch self {
        case .character:
            return "/character/"
        }
    }
    
    var method: Method {
        switch self {
        case .character:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .character(let page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
