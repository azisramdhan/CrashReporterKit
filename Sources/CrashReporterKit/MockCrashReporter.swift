//
//  File.swift
//  CrashReporterKit
//
//  Created by Azis Ramdhan on 13/06/25.
//

import Foundation

/// A mock crash reporter used for development or testing.
/// It prints messages to the console instead of sending them to Firebase.
public class MockCrashReporter: CrashReporting {
    
    public init() {}

    public func log(_ message: String) {
        print("CrashReporter Log: \(message)")
    }

    public func setUserID(_ id: String) {
        print("CrashReporter SetUserID: \(id)")
    }

    public func setCustomValue(_ value: Any, forKey key: String) {
        print("CrashReporter CustomValue: \(key) = \(value)")
    }

    public func record(error: Error) {
        print("CrashReporter Record Error: \(error)")
    }

    public func forceCrash() {
        print("CrashReporter Force Crash called")
    }
}
