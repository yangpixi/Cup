//
//  IconResouce.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import SwiftUI

enum IconResource: Hashable {
    case systemSymbol(_ iconName: String)
    case assetCatalog(_ resource: ImageResource)
    
    @ViewBuilder
    var resource: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    private var image: Image {
        switch self {
        case .assetCatalog(let resource):
            Image(resource)
        case .systemSymbol(let name):
            Image(systemName: name)
        }
    }
}
