//
//  View+Extensions.swift
//  Cup
//
//  Created by 空白 on 2026/3/13.
//

import SwiftUI

extension View {
    
    /// Removes the sidebar toggle button from the toolbar.
    func removeSidebarToggle() -> some View {
        toolbar(removing: .sidebarToggle)
            .toolbar {
                Color.clear
            }
    }
}
