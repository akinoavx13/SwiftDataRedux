//
//  DataContainerViewModifier.swift
//  SwiftDataRedux
//
//  Created by Maxime Maheo on 09/06/2023.
//

import SwiftData
import SwiftUI

struct DataContainerViewModifier: ViewModifier {
    // MARK: - Properties

    let container: ModelContainer

    private let isPreview: Bool

    // MARK: - Lifecycle

    init(isPreview: Bool) {
        self.isPreview = isPreview

        container = try! ModelContainer(
            for: Schema([AppState.self]),
            configurations: [ModelConfiguration(inMemory: isPreview)]
        )
    }

    // MARK: - Methods

    func body(content: Content) -> some View {
        if isPreview {
            content
                .generateData()
                .injectState()
                .modelContainer(container)
        } else {
            content
                .injectState()
                .modelContainer(container)
        }
    }
}

private struct GenerateDataViewModifier: ViewModifier {
    // MARK: - Properties

    @Environment(\.modelContext) private var modelContext

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .onAppear {
                modelContext.insert(AppState(tasks: [Task(name: "Clean room")]))
            }
    }
}

private struct InjectStateViewModifier: ViewModifier {
    // MARK: - Properties

    @Environment(\.modelContext) private var modelContext

    @Query private var states: [AppState]
    @State private var appState = AppState()

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .onAppear {
                if let contextAppState = states.first {
                    appState = contextAppState
                } else if states.isEmpty {
                    modelContext.insert(appState)
                }
            }
            .environment(\.appState, appState)
    }
}

extension View {
    func dataContainer(isPreview: Bool = false) -> some View {
        modifier(DataContainerViewModifier(isPreview: isPreview))
    }
}

private extension View {
    func generateData() -> some View {
        modifier(GenerateDataViewModifier())
    }

    func injectState() -> some View {
        modifier(InjectStateViewModifier())
    }
}
