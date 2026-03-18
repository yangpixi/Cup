//
//  MenuBarClickEventHandler.swift
//  Cup
//
//  Created by 空白 on 2026/3/10.
//

import AppKit

final class MenuBarClickEventHandler: NSObject {
    
    private var btnSwitch: NSStatusItem
    private var btnSeperator: NSStatusItem
    private weak var appState: AppState?
    private var isHidden = false // store the status of icon
    
    init(btnSwitch: NSStatusItem, btnSeperator: NSStatusItem, appState: AppState?) {
        self.btnSwitch = btnSwitch
        self.appState = appState
        self.btnSeperator = btnSeperator
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
        guard
            let button = btnSwitch.button,
            let seperator = btnSeperator.button
        else {
            Logger.handler.error("Fail to get button")
            return
        }
        
        if isHidden {
            button.image = NSImage(systemSymbolName: "circle.fill", accessibilityDescription: nil)
            seperator.image = nil
            btnSeperator.length = 2000
            isHidden = false
        } else {
            button.image = NSImage(systemSymbolName: "circle", accessibilityDescription: nil)
            seperator.image = NSImage(named: "ic_line")
            btnSeperator.length = 20
            isHidden = true
        }
        
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
