//
//  TasksView.swift
//  SwiftDataRedux
//
//  Created by Maxime Maheo on 09/06/2023.
//

import SwiftData
import SwiftUI

struct TasksView: View {
    // MARK: - Properties

    @Environment(\.appState) private var appState

    // MARK: - Body

    var body: some View {
        NavigationStack {
            List(appState.tasks) { task in
                Text(task.name)
            }
            .navigationTitle("Task")
            .toolbar {
                Button("Add") {
                    appState.tasks.append(Task(name: "test"))
                }
            }
        }
    }
}

#Preview {
    TasksView()
        .dataContainer(isPreview: true)
}
