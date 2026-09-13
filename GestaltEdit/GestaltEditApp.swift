//
//  GestaltEditApp.swift
//  GestaltEdit
//

import SwiftUI

@main
struct GestaltEditApp: App {
    @StateObject private var viewModel = GestaltViewModel()
    @AppStorage("hasShownVersionNotice") private var hasShownVersionNotice = false

    init() {
        AutomationCommand.runIfNeeded()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .alert("GestaltEdit", isPresented: Binding(
                    get: { !hasShownVersionNotice },
                    set: { _ in hasShownVersionNotice = true }
                )) {
                    Button("Tamam") {
                        hasShownVersionNotice = true
                    }
                } message: {
                    Text("""
                   This App designed İOS/İpadOS 27 .

                    Some Gestalt fields may not be available depending on the iOS version.
                    """)
                }
        }
    }
}
