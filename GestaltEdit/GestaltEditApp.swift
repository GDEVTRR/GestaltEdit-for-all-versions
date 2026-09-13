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
                    Bu sürüm iOS 17 ve üzeri için tasarlanmıştır.

                    Bazı Gestalt alanları iOS sürümüne göre kullanılamayabilir.
                    """)
                }
        }
    }
}
