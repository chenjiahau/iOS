import Foundation

enum NetworkError: Error {
    case invalidResponse
}

struct TodoClient {
    func getAll() async throws -> [Todo]? {
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .getAll))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let todos = try JSONDecoder().decode([Todo].self, from: data)
        
        return todos
    }
    
    func getById(id: Int) async throws -> Todo? {
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .getById(id)))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let todo = try JSONDecoder().decode(Todo.self, from: data)
        
        return todo
    }
}
