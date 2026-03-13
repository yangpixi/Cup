//
//  AppDelegate.swift
//  Cup
//
//  Created by 空白 on 2026/3/12.
//

import SwiftUI

@MainActor
class AppDelegate: NSObject, NSApplicationDelegate {
    private weak var appState: AppState?
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        guard let appState else {
            Logger.appDelegate.warning("Missing appState instance")
            return
        }
        
        appState.setAppDelegate(from: self)
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        guard let appState else {
            Logger.appDelegate.warning("Missing appState instance")
            return
        }
        
        /// initialize the application
        appState.initialize()
    }
    
    /// ensure application not to be stoped  by system
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        appState?.deactivate(withPolicy: .accessory)
        return false
    }
    
    func setAppState(from appState: AppState) {
        self.appState = appState
    }
}

private extension Logger {
    static let appDelegate = Logger(category: "AppDelegate")
}
