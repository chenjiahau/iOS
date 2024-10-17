import SwiftUI

struct ContentDetailView: View {
    let id: Int?
    @State private var todo: Todo?
    
    let todoClient = TodoClient()

    private func fetchTodoDetail() async {
        do {
            todo = try await todoClient.getById(id: id!)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            if let todo {
                Text("Id: \(todo.id)")
                Text("Title: \(todo.title)")
                Text("Status: \(MeasurementFormatter.status(value: todo.completed))")
            }
        }
        .task {
            await fetchTodoDetail()
        }
    }
}

#Preview {
    ContentDetailView(id: 1)
}
