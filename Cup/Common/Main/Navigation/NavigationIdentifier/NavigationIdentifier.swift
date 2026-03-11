//
//  NavtigationIdentifier.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import SwiftUI

protocol NavigationIdentifier: CaseIterable, Hashable, Identifiable, RawRepresentable {
    var localizer: LocalizedStringKey { get }
}

extension NavigationIdentifier where ID == Int {
    var id: Int { hashValue }
}

extension NavigationIdentifier where RawValue == String {
    var localizer: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
