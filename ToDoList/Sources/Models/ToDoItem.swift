import Foundation

struct ToDoItem: Equatable, Codable, Identifiable {
    var id = UUID()
    var title: String
    var isDone: Bool = false
}
//New type with three choices for Picker in ToDoListView
enum TaskFilterStatus: String, CaseIterable {
    case all = "All"
    case done = "Done"
    case notDone = "Not Done"
}
