import Foundation

enum APIEndpoint {
    case getAll
    case getById(Int)
    
    private var path: String {
        switch self {
        case .getAll:
            return "/todos"
        case .getById(let id):
            return "/todo/\(id)"
        }
    }
    
    static func endpointURL(for endpoint: APIEndpoint) -> URL {
        let endpointPath = endpoint.path
        return URL(string: Constants.server.baseURL + endpointPath)!
    }
}
