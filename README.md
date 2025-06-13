# CrashReporterKit

**CrashReporterKit** is a lightweight, modular Swift package that abstracts Firebase Crashlytics functionality behind a protocol. It allows clean integration of crash reporting in your app while maintaining testability and separation of concerns.

---

## 🚀 Features

- Abstracts Firebase Crashlytics behind a `CrashReporting` protocol
- Supports test and development environments with a `MockCrashReporter`
- Keeps Firebase-specific logic out of your application layer
- Designed for use with dependency injection and scalable architecture

---

## 📦 Installation

### Swift Package Manager

Add to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/your-org/CrashReporterKit.git", from: "1.0.0"),
```

Then import the product into your target:

```swift
.target(
  name: "YourApp",
  dependencies: [
    .product(name: "CrashReporterKit", package: "CrashReporterKit")
  ]
)
```

> **Important:** You also need to add `FirebaseCrashlytics` as a dependency in your app target.

---

## 🔧 Firebase Initialization

Do **not** initialize Firebase inside the `CrashReporterKit` package.

Instead, initialize it in your main app target:

```swift
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
```

---

## 🧩 Usage

### Import and Initialize

```swift
import CrashReporterKit

let crashReporter: CrashReporting = FirebaseCrashReporter()
crashReporter.log("App launched")
crashReporter.setUserID("user_123")
crashReporter.setCustomValue("premium", forKey: "account_type")
crashReporter.record(error: SomeError())
```

### Force a Crash (for testing)

```swift
crashReporter.forceCrash()
```

---

## 🧪 Testing

Inject the `MockCrashReporter` during development or unit tests:

```swift
let crashReporter: CrashReporting = MockCrashReporter()
crashReporter.log("This is a test log")
```

---

## 📐 Architecture

```
App Layer → CrashReporting (Protocol)
              ├── FirebaseCrashReporter (Production)
              └── MockCrashReporter (Testing)
```

This structure allows maximum flexibility and minimal coupling to Firebase.

---

## 📄 License

MIT
