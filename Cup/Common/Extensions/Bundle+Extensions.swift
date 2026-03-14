//
//  Bundle+Extensions.swift
//  Cup
//
//  Created by 空白 on 2026/3/13.
//

import Foundation

extension Bundle {
    /// The bundle's copyright string.
    ///
    /// This accessor looks for an associated value for the "NSHumanReadableCopyright"
    /// key in the bundle's Info.plist. If a string value cannot be found for this key,
    /// this accessor returns `nil`.
    var copyrightString: String? {
        object(forInfoDictionaryKey: "NSHumanReadableCopyright") as? String
    }

    /// The bundle's version string.
    ///
    /// This accessor looks for an associated value for the "CFBundleShortVersionString"
    /// key in the bundle's Info.plist. If a string value cannot be found for this key,
    /// this accessor returns `nil`.
    var versionString: String? {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    /// The bundle's build string.
    ///
    /// This accessor looks for an associated value for the "CFBundleVersion" key in
    /// the bundle's Info.plist. If a string value cannot be found for this key, this
    /// accessor returns `nil`.
    var buildString: String? {
        object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
}
