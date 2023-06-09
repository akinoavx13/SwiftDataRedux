//
//  SwiftDataReduxApp.swift
//  SwiftDataRedux
//
//  Created by Maxime Maheo on 09/06/2023.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataReduxApp: App {
    // MARK: - Properties

    // MARK: - Body

    var body: some Scene {
        WindowGroup {
            TasksView()
                .dataContainer()
        }
    }
}
