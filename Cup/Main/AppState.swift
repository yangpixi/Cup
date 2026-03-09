//
//  AppState.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import SwiftUI

@MainActor
@Observable
final class AppState {
    let navigationState = AppNavigationState()
}
