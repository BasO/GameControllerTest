//
//  GameControllerTestApp.swift
//  GameControllerTest
//
//  Created by Bas Oppenheim on 11/06/2024.
//

import SwiftUI

@main
struct GameControllerTestApp: App {
    @ObservedObject var gameControllerManager = GameControllerManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameControllerManager)
        }
    }
}
