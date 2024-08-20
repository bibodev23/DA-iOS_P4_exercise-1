//
//  ButtonAddTaskView.swift
//  ToDoList
//
//  Created by Boualem Dahmane on 20/08/2024.
//

import SwiftUI
//Button for toggle visibility of the task addition section in ToDoListView
struct ButtonAddTaskView: View {
    @Binding var isAddTodo: Bool
    var body: some View {
        Button(action: {
            isAddTodo.toggle()
        }) {
            Text(isAddTodo ? "Close" : "Add Task")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .padding()

    }
}

#Preview {
    ButtonAddTaskView(isAddTodo: .constant(false))
}
