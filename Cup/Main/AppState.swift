//
//  AppState.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import SwiftUI

@MainActor
@Observable
final class AppState {
    let navigationState = AppNavigationState()
    
    @ObservationIgnored private weak var appDelegate: AppDelegate?
    @ObservationIgnored private var isActivated = false
    @ObservationIgnored @Environment(\.openWindow) private var openWindow
    
    @ObservationIgnored private(set) lazy var menuBarController = MenuBarController(appState: self)
    @ObservationIgnored private(set) lazy var settingsWindowController = SettingsWindowController(appState: self)
    
    func initialize() {
        menuBarController.initialize()
    }
    
    
    
    @objc func openSettingsWindow() {
        with(EnvironmentValues()) { env in
            env.openWindow(id: Constant.settingWindowId)
        }
    }
    
    /// activate View
    func activate(withPolicy policy: NSApplication.ActivationPolicy) {
        func activate() {
            if let frontApp = NSWorkspace.shared.frontmostApplication {
                NSRunningApplication.current.activate(from: frontApp)
            } else {
                NSApp.activate()
            }
            NSApp.setActivationPolicy(policy)
        }
        
        if isActivated {
            activate()
        } else {
            isActivated = true
            NSRunningApplication.runningApplications(withBundleIdentifier: "com.apple.dock").first?.activate()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                activate()
            }
        }
        
    }
    
    func setAppDelegate(from appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }
}
