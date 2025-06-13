//
//  File.swift
//  CrashReporterKit
//
//  Created by Azis Ramdhan on 12/06/25.
//

import FirebaseCrashlytics

/// Concrete implementation of `CrashReporting` using Firebase Crashlytics.
public class FirebaseCrashReporter: CrashReporting {
    
    /// Initializes the FirebaseCrashReporter.
    public init() {}

    /// Logs a custom message to the Firebase Crashlytics console.
    public func log(_ message: String) {
        Crashlytics.crashlytics().log(message)
    }

    /// Assigns a user identifier to help track issues per user.
    public func setUserID(_ id: String) {
        Crashlytics.crashlytics().setUserID(id)
    }

    /// Stores custom metadata with crash reports.
    public func setCustomValue(_ value: Any, forKey key: String) {
        Crashlytics.crashlytics().setCustomValue(value, forKey: key)
    }

    /// Records a caught error (non-fatal) to be visible in Firebase.
    public func record(error: Error) {
        Crashlytics.crashlytics().record(error: error)
    }

    /// Triggers a crash to verify Crashlytics setup.
    public func forceCrash() {
        fatalError("Forced crash for testing Crashlytics integration")
    }
}

