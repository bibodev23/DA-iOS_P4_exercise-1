//
//  AddTaskSectionView.swift
//  ToDoList
//
//  Created by Boualem Dahmane on 20/08/2024.
//

import SwiftUI
// A view provides an interface to add task in to-do list
struct AddTaskSectionView: View {
    @Binding var newTodoTitle: String
    @Binding var isShowingAlert: Bool
    @Binding var isAddingTodo: Bool
    var viewModel: ToDoListViewModel
    var body: some View {
        HStack {
            TextField("Enter Task Title", text: $newTodoTitle)
                .padding(.leading)

            Spacer()
            
            Button(action: {
                if newTodoTitle.isEmpty {
                    isShowingAlert = true
                } else {
                    viewModel.add(
                        item: .init(
                            title: newTodoTitle
                        )
                    )
                    newTodoTitle = "" // Reset newTodoTitle to empty.
                    isAddingTodo = false // Close the bottom view after adding
                }
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        }
    }

#Preview {
    AddTaskSectionView(newTodoTitle: .constant(""), isShowingAlert: .constant(true), isAddingTodo: .constant(true), viewModel: ToDoListViewModel(repository: ToDoListRepository()))
}
