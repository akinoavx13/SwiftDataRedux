//
//  StateEnvironment.swift
//  SwiftDataRedux
//
//  Created by Maxime Maheo on 09/06/2023.
//

import SwiftUI

private struct StateEnvironment: EnvironmentKey {
    static let defaultValue = AppState()
}

extension EnvironmentValues {
    var appState: AppState {
        get { self[StateEnvironment.self] }
        set { self[StateEnvironment.self] = newValue }
    }
}
