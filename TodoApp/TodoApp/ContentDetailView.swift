import SwiftUI

struct ContentDetailView: View {
    @EnvironmentObject private var store: Store
    let id: Int
    
    private func populateTodo() async {
        do {
            try await store.getById(id: id)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            if let todo = store.todo {
                Text("Id: \(todo.id)")
                Text("Title: \(todo.title)")
                Text("Status: \(MeasurementFormatter.status(value: todo.completed))")
            }
        }
        .task {
            await populateTodo()
        }
    }
}

#Preview {
    ContentDetailView(id: 1)
}
