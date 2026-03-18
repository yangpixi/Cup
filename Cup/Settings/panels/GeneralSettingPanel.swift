//
//  GeneralSettingPanel.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import SwiftUI
import LaunchAtLogin

struct GeneralSettingPanel: View {
    var body: some View {
        VStack(spacing: 0) {
            CupGroupBox {
                LaunchAtLogin.Toggle()
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
