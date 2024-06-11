//
//  VibrateManager.swift
//  EMDR
//
//  Created by Bas Oppenheim on 24/07/2021.
//

import SwiftUI
import GameController
import CoreHaptics

class VibrationManager {
    static let shared = VibrationManager()
    
    public func vibrate(controller: GCController) {
        HapticUtility.playHapticsFile(named: "Boing", on: controller)
    }
}

class HapticUtility {
    static var engines: [GCController: CHHapticEngine] = [:]
    
    // Initialize a new HapticUtility object.
    class func initHapticsFor(controller: GCController) {
        let newEngine = controller.haptics?.createEngine(withLocality: .default)
        newEngine?.playsHapticsOnly = true
        engines[controller] = newEngine
    }
    
    class func deinitHapticsFor(controller: GCController) {
        engines.removeValue(forKey: controller)
    }
    
    class func playHapticsFile(named filename: String, on controller: GCController? = .current) {
        guard let currentController = controller,
              let engine = engines[currentController],
              let path = Bundle.main.path(forResource: filename, ofType: "ahap")
        else { return }
        
        do {
            // Start the engine in case it's idle.
            try engine.start()
            // Tell the engine to play a pattern.
            try engine.playPattern(from: URL(fileURLWithPath: path))
        } catch { // Process engine startup errors.
            print("An error occured playing \(filename): \(error).")
        }
    }
}
