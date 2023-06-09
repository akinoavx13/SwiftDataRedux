//
//  AppState.swift
//  SwiftDataRedux
//
//  Created by Maxime Maheo on 09/06/2023.
//

import SwiftData

@Model
final class AppState {
    // MARK: - Properties

    @Relationship(.cascade) var tasks: [Task]

    // MARK: - Lifecycle

    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
}
