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
        Window(Constant.settingWindowTitle, id: Constant.settingWindowId) {
            SettingsView()
        }
        .defaultSize(width: 900, height: 625)
        .environment(appState)
        .environment(appState.navigationState)
    }
}
