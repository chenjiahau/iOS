import SwiftUI

struct ContentView: View {
    @State private var todos: [Todo]?

    let todoClient = TodoClient()

    private func fetchTodoList() async {
        do {
            todos = try await todoClient.getAll()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Todo List")
                    .font(.largeTitle)
                List(todos ?? []) { todo in
                    NavigationLink(destination: ContentDetailView(id: todo.id)) {
                        Text(todo.title)
                    }
                }
                .background(.white)
            }
            .task {
                await fetchTodoList()
            }
        }
    }
}

#Preview {
    ContentView()
}
