import Foundation

struct Todo: Codable, Identifiable {
    let id: Int
    let title: String
    let completed: Bool
}
