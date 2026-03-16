//
//  AboutSettingPanel.swift
//  Cup
//
//  Created by 空白 on 2026/3/13.
//

import SwiftUI

struct AboutSettingPanel: View {
    var body: some View {
        VStack(spacing: 0) {
            iconAndCopyright
            toolbar
        }
    }
    
    @ViewBuilder
    private var iconAndCopyright: some View {
        HStack(spacing: 10) {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.quinary, in: RoundedRectangle(cornerRadius: 20, style: .circular))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
        .padding(EdgeInsets(top: -10, leading: 20, bottom: 5, trailing: 20))
    }
    
    @ViewBuilder
    private var toolbar: some View {
        HStack {
            Button("Quit Cup") {
                NSApp.terminate(nil)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
}
