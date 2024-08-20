//
//  ListItemsView.swift
//  ToDoList
//
//  Created by Boualem Dahmane on 20/08/2024.
//

import SwiftUI
//List items for ToDOListView
struct ListItemsView: View {
    @ObservedObject var viewModel: ToDoListViewModel
    @Binding var filterIndex: TaskFilterStatus
    var body: some View {
        List {
            ForEach(viewModel.applyFilter(at: filterIndex)) { item in
                HStack {
                    Button(action: {
                        viewModel.toggleTodoItemCompletion(item)
                    }) {
                        Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(item.isDone ? .green : .primary)
                    }
                    Text(item.title)
                        .font(item.isDone ? .subheadline : .body)
                        .strikethrough(item.isDone)
                        .foregroundColor(item.isDone ? .gray : .primary)
                }
            }
            .onDelete { indices in
                indices.forEach { index in
                    let item = viewModel.toDoItems[index]
                    viewModel.removeTodoItem(item)
                }
            }
        }
    }
}
#Preview {
    return ListItemsView(viewModel: ToDoListViewModel(repository: ToDoListRepository()), filterIndex: .constant(.all))
}


