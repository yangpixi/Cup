//
//  SettingsView.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import SwiftUI
import SwiftUIIntrospect

struct SettingsView: View {
    @Environment(AppNavigationState.self) var navigationState
    @Environment(\.sidebarRowSize) var sidebarRowSize
    
    var body: some View {
        NavigationSplitView {
            sidebar
        } detail: {
            detailView
        }
        .navigationTitle(navigationState.settingItemIdentifier.localizer)
        .introspect(.navigationSplitView, on: .macOS(.v15, .v26)) { splitview in
            if let delegate = splitview.delegate as? NSSplitViewController {
                delegate.splitViewItems.first?.canCollapse = false
                delegate.splitViewItems.first?.canCollapseFromWindowResize = false
            }
        }
    }
    
    @ViewBuilder
        private var sidebar: some View {
            List(selection: Bindable(navigationState).settingItemIdentifier) {
                Section {
                    ForEach(SettingItemIdentifier.allCases, id: \.self) { items in
                        item(for: items)
                    }
                } header: {
                    Text("Cup")
                        .font(.system(size: 36, weight: .medium))
                        .foregroundStyle(.primary)
                        .padding(.vertical, 20)
                }
            }
            .listStyle(.sidebar)
            .removeSidebarToggle()
            .scrollDisabled(true)
        }
    
    @ViewBuilder
    private var detailView: some View {
        switch navigationState.settingItemIdentifier {
        case .about:
            AboutSettingPanel()
        case .general:
            GeneralSettingPanel()
        }
    }
    
    @ViewBuilder
    private func item(for identifiers: SettingItemIdentifier) -> some View {
        Label {
            Text(identifiers.localizer)
                .font(.system(size: sidebarItemFontSize))
                .padding(.leading, 2)
        } icon: {
            icon(for: identifiers).resource
        }
        .frame(height: sidebarItemHeight)
        .padding(.horizontal, 5)
    }
    
    private func icon(for identifiers: SettingItemIdentifier) -> IconResource {
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
