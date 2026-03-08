//
//  AppState.swift
//  Cup
//
//  Created by 空白 on 2026/3/8.
//

import Combine
import SwiftUI

@MainActor
final class AppState: ObservableObject {
    let navigationState = AppNavigationState()
}
