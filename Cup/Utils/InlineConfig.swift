//
//  InlineConfig.swift
//  Cup
//
//  Created by 空白 on 2026/3/13.
//

@discardableResult
func with<Value>(_ value: Value, update: (inout Value) throws -> Void) rethrows -> Value {
    var copy = value
    try update(&copy)
    return copy
}
