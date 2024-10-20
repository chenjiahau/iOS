import Foundation

enum NetworkError: Error {
    case invalidResponse
}

@MainActor
class Store: ObservableObject {

    @Published var todos: [Todo] = []
    @Published var todo: Todo?

    func getAll() async throws {
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .getAll))

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }

        self.todos = try JSONDecoder().decode([Todo].self, from: data)
    }

    func getById(id: Int) async throws {
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .getById(id)))

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }

        self.todo = try JSONDecoder().decode(Todo.self, from: data)
    }
}
