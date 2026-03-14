//
//  SettingsWindow.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import SwiftUI

struct SettingsWindow: Scene {
    
    var appState: AppState
    
    var body: some Scene {
        Window(Constants.settingWindowTitle, id: Constants.settingWindowId) {
            SettingsView()
                .frame(minWidth: 825, minHeight: 500)
        }
        .commandsRemoved()
        .windowResizability(.contentSize)
        .defaultSize(width: 900, height: 625)
        .environment(appState)
        .environment(appState.navigationState)
    }
}
