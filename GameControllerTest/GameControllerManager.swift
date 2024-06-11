//
//  GameControllerManager.swift
//  EMDR
//
//  Created by Bas Oppenheim on 11/09/2021.
//

import Foundation
import GameController
import CoreHaptics


class GameControllerManager: ObservableObject {
    @Published var gameControllers: [GCController] = []
    
    init() {
        observeForGameControllers()
    }

    public func observeForGameControllers() {
        NotificationCenter.default.addObserver(
                self, selector: #selector(self.handleControllerDidConnect),
                name: NSNotification.Name.GCControllerDidConnect, object: nil)

        NotificationCenter.default.addObserver(
            self, selector: #selector(self.handleControllerDidDisconnect),
            name: NSNotification.Name.GCControllerDidDisconnect, object: nil)
        
        GCController.startWirelessControllerDiscovery {
            print("Finished discovering controllers")
        }
    }
    
    @objc
    func handleControllerDidConnect(_ notification: Notification) {
        guard let gameController = notification.object as? GCController else {
            return
        }
        
        DispatchQueue.main.async {
            self.registerGameController(gameController)
        }
    }

    @objc
    func handleControllerDidDisconnect(_ notification: Notification) {
        guard let gameController = notification.object as? GCController else {
            return
        }
        
        DispatchQueue.main.async {
            self.unregisterGameController(gameController)
        }
    }
    
    func registerGameController(_ gameController: GCController) {
        HapticUtility.initHapticsFor(controller: gameController)
        gameControllers.append(gameController)
        
        print("Added new game controller. \(gameControllers.count)")
    }
    
    func unregisterGameController(_ gameController: GCController) {
        HapticUtility.deinitHapticsFor(controller: gameController)
        gameControllers.removeAll(where: {$0.vendorName == gameController.vendorName && $0.battery == gameController.battery })
        
        print("Removed game controller. \(gameControllers.count)")
    }
}
