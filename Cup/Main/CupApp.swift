//
//  CupApp.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import SwiftUI

@main
struct CupApp: App {
    @NSApplicationDelegateAdaptor var appDelegate: AppDelegate
    var appState = AppState()
    
    init() {
        appDelegate.setAppState(from: appState)
    }
    
    var body: some Scene {
        SettingsWindow(appState: appState)
    }
}
