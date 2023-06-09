//
//  Task.swift
//  SwiftDataRedux
//
//  Created by Maxime Maheo on 09/06/2023.
//

import Foundation.NSUUID
import SwiftData

@Model
final class Task: Identifiable {
    // MARK: - Properties

    @Attribute(.unique) let id: UUID
    let name: String

    // MARK: - Lifecycle

    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
