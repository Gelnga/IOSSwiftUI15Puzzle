//
//  app_15_puzzle_swiftUIAppApp.swift
//  app-15-puzzle-swiftUIApp
//
//  Created by Gleb Engalychev on 13.01.2022.
//

import SwiftUI

@main
struct app_15_puzzle_swiftUIAppApp: App {
    let persistenceController = PersistenceController.shared
    private let brain = GameBrain()

    var body: some Scene {
        WindowGroup {
            ContentWrapper(brain: GameBrain())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
