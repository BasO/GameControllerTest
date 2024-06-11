//
//  ContentView.swift
//  GameControllerTest
//
//  Created by Bas Oppenheim on 11/06/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameControllerManager: GameControllerManager
    
    var body: some View {
        VStack {
            Text("Game Controllers:")
                .font(.title)
            ForEach(gameControllerManager.gameControllers, id: \.self) { controller in
                Button("Vibrate \(controller.vendorName ?? "Gamepad")") {
                    VibrationManager.shared.vibrate(controller: controller)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
