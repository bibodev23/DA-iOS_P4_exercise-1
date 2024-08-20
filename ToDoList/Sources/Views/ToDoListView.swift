import SwiftUI
//Main view for displaying and managing the to-do list
struct ToDoListView: View {
    @ObservedObject var viewModel: ToDoListViewModel
    @State private var newTodoTitle = ""
    @State private var isShowingAlert = false
    @State private var isAddingTodo = false
    
    // New state for filter index
    @State private var filterIndex: TaskFilterStatus = .all
    
    var body: some View {
        NavigationView {
            VStack {
                // Picker for filtering tasks based on their status(all, done, not done)
                Picker("Items filter", selection: $filterIndex) {
                    ForEach(TaskFilterStatus.allCases, id: \.self) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                // List of tasks
                ListItemsView(viewModel: viewModel, filterIndex: $filterIndex)
        
                // Sticky bottom view for adding todos
                if isAddingTodo {
                    AddTaskSectionView(newTodoTitle: $newTodoTitle, isShowingAlert: $isShowingAlert, isAddingTodo: $isAddingTodo, viewModel: viewModel)
                }

                // Button to toggle the bottom add view
                ButtonAddTaskView(isAddTodo: $isAddingTodo)

            }
            .navigationBarTitle("To-Do List")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(
            viewModel: ToDoListViewModel(
                repository: ToDoListRepository()
            )
        )
    }
}

