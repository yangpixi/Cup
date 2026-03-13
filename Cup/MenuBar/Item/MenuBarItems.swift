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
        
        return menu
    }
}

private extension Logger {
    static let menuBarItems = Logger(category: "MenuBarItems")
}
