//
//  SettingsWindowController.swift
//  Cup
//
//  Created by 空白 on 2026/3/10.
//

import SwiftUI

class SettingsWindowController {
    
    var settingsWindow: NSWindow?
    
    @objc func newOrBringWindow() {
        if let existingWindow = settingsWindow {
            existingWindow.makeKeyAndOrderFront(nil)
            NSApp.activate(ignoringOtherApps: true)
            return
        }
        
        let newView = SettingsView()
        
        settingsWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 400, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        
        settingsWindow?.title = "Cup"
        settingsWindow?.center()
        
        settingsWindow?.isReleasedWhenClosed = false
        settingsWindow?.contentViewController = NSHostingController(rootView: newView)
        settingsWindow?.makeKeyAndOrderFront(nil)
        
        NSApp.activate(ignoringOtherApps: true)
    }
    
}
