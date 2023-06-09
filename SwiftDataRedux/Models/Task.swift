//
//  Task.swift
//  SwiftDataRedux
//
//  Created by Maxime Maheo on 09/06/2023.
//

import Foundation.NSUUID
import SwiftData

@Model
class Task {
    // MARK: - Properties

    @Attribute(.unique) let id = UUID()
    @Attribute let name: String

    // MARK: - Lifecycle

    init(name: String) {
        self.name = name
    }
}
