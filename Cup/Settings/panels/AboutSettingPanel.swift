//
//  AboutSettingPanel.swift
//  Cup
//
//  Created by 空白 on 2026/3/13.
//

import SwiftUI

struct AboutSettingPanel: View {
    var body: some View {
        VStack {
            mainbody
        }
    }
    
    @ViewBuilder
    private var mainbody: some View {
        HStack {
            Image(systemName: "cup.and.saucer.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            VStack(alignment: .leading) {
                Text("Cup")
                    .font(.system(size: 72, weight: .medium))
                    .foregroundStyle(.primary)

                Text("Version \(Constants.versionString)")
                    .font(.system(size: 18))
                    .foregroundStyle(.secondary)

                Text(Constants.copyrightString)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.tertiary)
            }
        }
    }
}
