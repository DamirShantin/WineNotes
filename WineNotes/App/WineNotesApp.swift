//
//  WineNotesApp.swift
//  WineNotes
//
//  Created by Дамир Шаймуханбетов on 24.04.2026.
//

import SwiftUI

@main
struct WineNotesApp: App {
    @State private var coordinator = AppCoordinator()
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environment(coordinator)
        }
    }
}
