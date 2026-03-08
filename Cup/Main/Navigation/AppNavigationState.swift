//
//  AppNavigationState.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import Observation
import Combine

@MainActor
@Observable
final class AppNavigationState: ObservableObject {
    var settingItemIdentifier: SettingItemIdentifier = .general
}
