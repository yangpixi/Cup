//
//  CupApp.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import SwiftUI

@main
struct CupApp: App {
    
    @ObservedObject var appState = AppState()
    
    var body: some Scene {
        SettingsWindow(appState: appState)
    }
}
