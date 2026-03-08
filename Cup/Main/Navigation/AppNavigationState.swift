//
//  AppNavigationState.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import Observation

@MainActor
@Observable
final class AppNavigationState {
    var settingItemIdentifier: SettingItemIdentifier = .general
}
