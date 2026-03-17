//
//  CupGroupBox.swift
//  Cup
//
//  Created by 空白 on 2026/3/17.
//

import SwiftUI

struct CupGroupBox<Content: View>: View {
    
    private var content: Content
    
    private var backgroundShape: some InsettableShape {
        RoundedRectangle(cornerRadius: 15, style: .circular)
    }
    
    init(
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            content
                .toggleStyle(CupFormToggleStyle())
                .padding(EdgeInsets(top: 13, leading: 10, bottom: 13, trailing: 10))
        }
        .background {
            backgroundShape
                .fill(.quinary)
        }
        .padding()
    }
        
}

private struct CupFormToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        CupLabeledContent {
            Toggle(isOn: configuration.$isOn) {
                configuration.label
            }
            .labelsHidden()
            .toggleStyle(.switch)
            .controlSize(.mini)
        } label: {
            configuration.label
        }
    }
}

