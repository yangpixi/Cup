//
//  Logger.swift
//  Cup
//
//  Created by 空白 on 2026/3/12.
//

import OSLog

struct Logger {
    /// The unified logger at the base of this logger.
    private let base: os.Logger

    /// Creates a logger for Cup using the specified category.
    init(category: String) {
        self.base = os.Logger(subsystem: Constants.bundleIdentifier, category: category)
    }

    /// Logs the given informative message to the logger.
    func info(_ message: String) {
        base.info("\(message, privacy: .public)")
    }

    /// Logs the given debug message to the logger.
    func debug(_ message: String) {
        base.debug("\(message, privacy: .public)")
    }

    /// Logs the given error message to the logger.
    func error(_ message: String) {
        base.error("\(message, privacy: .public)")
    }

    /// Logs the given warning message to the logger.
    func warning(_ message: String) {
        base.warning("\(message, privacy: .public)")
    }
}
