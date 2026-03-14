//
//  MenuBarItems.swift
//  Cup
//
//  Created by 空白 on 2026/3/10.
//

import AppKit

class MenuBarItems {
    
    private var appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func buildMenu() -> NSMenu {
        
        let menu = NSMenu()
        
        let prefItem = NSMenuItem(
            title: "Preference...".localized,
            action: #selector(SettingsWindowController.openSettingsWindow),
            keyEquivalent: "p"
        )
        
        prefItem.target = appState.settingsWindowController
        
        menu.addItem(prefItem)
        
        menu.addItem(.separator())
        
        let quitItem = NSMenuItem(
            title: "Quit Cup".localized,
            action: #selector(SettingsWindowController.quitApplication),
            keyEquivalent: "q"
        )
        quitItem.target = appState.settingsWindowController
        
        menu.addItem(quitItem)
        return menu
    }
}

private extension Logger {
    static let menuBarItems = Logger(category: "MenuBarItems")
}
