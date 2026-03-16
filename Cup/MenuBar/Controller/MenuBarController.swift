//
//  MenuBarController.swift
//  Cup
//
//  Created by 空白 on 2026/3/10.
//

import SwiftUI

class MenuBarController {
    
    private weak var appState: AppState?
    
    //MARK: - menuBarItems
    private var btnSwitch = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    private var btnSeperator = NSStatusBar.system.statusItem(withLength: 1)
    
    private lazy var menuBarClickEventHandler = MenuBarClickEventHandler(
        btnSwitch: btnSwitch,
        btnSeperator: btnSeperator,
        appState: appState
    )
    
    //MARK: - initializing method
    init(appState: AppState) {
        self.appState = appState
    }
    
    func initialize() {
        initializeBtn()
    }
    
    private func initializeBtn() {
        if let button = btnSwitch.button {
            button.image = NSImage(systemSymbolName: "circle", accessibilityDescription: nil)
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
            button.target = menuBarClickEventHandler
            button.action = #selector(MenuBarClickEventHandler.handleMouseClick)
        }
        
        if let seperator = btnSeperator.button {
            seperator.image = NSImage(named: "ic_line")
        }
    }
}
