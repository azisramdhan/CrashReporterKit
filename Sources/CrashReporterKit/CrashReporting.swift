//
//  File.swift
//  CrashReporterKit
//
//  Created by Azis Ramdhan on 12/06/25.
//

import Foundation

/// A protocol to abstract crash reporting functionality.
/// Allows you to switch between real and mock implementations for Firebase Crashlytics.
public protocol CrashReporting {
    
    /// Logs a custom message to Crashlytics.
    func log(_ message: String)
    
    /// Sets a unique user identifier.
    func setUserID(_ id: String)
    
    /// Sets a custom key-value pair visible in Crashlytics dashboard.
    func setCustomValue(_ value: Any, forKey key: String)
    
    /// Records a non-fatal error to Crashlytics.
    func record(error: Error)
    
    /// Forces the app to crash (used for testing Crashlytics setup).
    func forceCrash()
}
