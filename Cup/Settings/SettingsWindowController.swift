//
//  SettingsWindowController.swift
//  Cup
//
//  Created by 空白 on 2026/3/13.
//

import SwiftUI

class SettingsWindowController {
    private weak var appState: AppState?
    
    init(appState: AppState? = nil) {
        self.appState = appState
    }
    
    @objc func openSettingsWindow() {
        guard let appState else {
            Logger.settingsWindowController.warning("Missing appState instance")
            return
        }
        /// open window
        with(EnvironmentValues()) { env in
            env.openWindow(id: Constants.settingWindowId)
        }
        
        /// activate the window
        appState.activate(withPolicy: .regular)
    }
    
    @objc func quitApplication() {
        NSApp.terminate(nil)
    }
}

private extension Logger {
    static let settingsWindowController = Logger(category: "SettingsWindowController")
}
