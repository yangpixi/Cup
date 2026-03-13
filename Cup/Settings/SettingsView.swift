//
//  SettingsView.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import SwiftUI

struct SettingsView: View {
    @Environment(AppNavigationState.self) var navigationState
    @Environment(\.sidebarRowSize) var sidebarRowSize
    
    var body: some View {
        NavigationSplitView {
            sideBar
        } detail: {
            Text("TEST")
        }.navigationTitle(navigationState.settingItemIdentifier.localizer)
    }
    
    @ViewBuilder
    private var sideBar: some View {
        List(selection: Bindable(navigationState).settingItemIdentifier) {
            Section {
                ForEach(SettingItemIdentifier.allCases, id: \.self) { item in
                    items(for: item)
                }
            } header: {
                Text("Cup")
                    .font(.system(size: 25, weight: .medium))
                    .foregroundStyle(.primary)
                    .padding(.vertical, 10)
            }
        }
    }
    
    @ViewBuilder
    private func items(for identifiers: SettingItemIdentifier) -> some View {
        Label {
            Text(identifiers.localizer)
                .font(.system(size: sidebarItemFontSize))
                .padding(.leading, 5)
        } icon: {
            icons(for: identifiers).resource
        }
        .frame(height: sidebarItemHeight)
        .padding(.horizontal, 5)
    }
    
    private func icons(for identifiers: SettingItemIdentifier) -> IconResource {
        switch identifiers {
        case .about: .systemSymbol("cup.and.saucer")
        case .general: .systemSymbol("gearshape")
        }
    }
    
    private var sidebarWidth: CGFloat {
        switch sidebarRowSize {
        case .small: 190
        case .medium: 210
        case .large: 230
        @unknown default: 210
        }
    }
    
    private var sidebarItemHeight: CGFloat {
        switch sidebarRowSize {
        case .small: 26
        case .medium: 32
        case .large: 34
        @unknown default: 32
        }
    }
    
    private var sidebarItemFontSize: CGFloat {
        switch sidebarRowSize {
        case .small: 13
        case .medium: 15
        case .large: 16
        @unknown default: 15
        }
    }
}
