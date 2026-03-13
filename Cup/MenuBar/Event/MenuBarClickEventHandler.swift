//
//  MenuBarClickEventHandler.swift
//  Cup
//
//  Created by 空白 on 2026/3/10.
//

import AppKit

final class MenuBarClickEventHandler: NSObject {
    
    private var btnSwitch: NSStatusItem
    private weak var appState: AppState?
    
    init(btnSwitch: NSStatusItem, appState: AppState?) {
        self.btnSwitch = btnSwitch
        self.appState = appState
    }
    
    @objc func handleMouseClick() {
        if let event = NSApp.currentEvent {
            switch event.type {
                
            case .leftMouseUp:
                switchHideStatus()
            case .rightMouseUp:
                showMenuItem()
            default:
                return
                
            }
        }
    }
    
    private func switchHideStatus() {
        
    }
    
    private func showMenuItem() {
        guard let appState else {
            Logger.handler.warning("Missing appState instance")
            return
        }
        
        let menu = MenuBarItems(appState: appState).buildMenu()
        btnSwitch.menu = menu
        btnSwitch.button?.performClick(nil)
        btnSwitch.menu = nil
    }
}

private extension Logger {
    static let handler = Logger(category: "MenuBarClickEventHandler")
}
