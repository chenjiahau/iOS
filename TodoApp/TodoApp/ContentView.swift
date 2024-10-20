import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: Store

    private func populateTodos() async {
        do {
           try await store.getAll()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Todo List")
                    .font(.largeTitle)
                List(store.todos) { todo in
                    NavigationLink(destination: ContentDetailView(id: todo.id)) {
                        Text(todo.title)
                    }
                }
            }
        }
        .task {
            await populateTodos()
        }
    }
}

#Preview {
    ContentView()
}
