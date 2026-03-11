//
//  String+Extensions.swift
//  Cup
//
//  Created by 空白 on 2026/3/10.
//

import AppKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
}
