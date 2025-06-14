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

```text
                        +---------------------+
                        |     App Layer       |
                        |  (UI, ViewModel)    |
                        +----------+----------+
                                   |
                                   | depends on
                                   v
                      +------------+-------------+
                      |      CrashReporting      | <----- Protocol (Abstraction)
                      +------------+-------------+
                                   |
         +-------------------------+-------------------------+
         |                                                   |
         v                                                   v
+--------------------------+                     +--------------------------+
|  FirebaseCrashReporter   |                     |   MockCrashReporter       |
|  (Production)            |                     |   (Development/Testing)   |
+--------------------------+                     +--------------------------+
         |
         v
+-----------------------------+
|     Firebase Crashlytics    |
|     (3rd Party SDK/API)     |
+-----------------------------+
```

---

## 📁 File Structure

```
CrashReporterKit/
├── Package.swift
├── Sources/
│   └── CrashReporterKit/
│       ├── CrashReporting.swift          # Protocol definition
│       ├── FirebaseCrashReporter.swift   # Firebase Crashlytics implementation
│       └── MockCrashReporter.swift       # Mock implementation for testing
├── Tests/
│   └── CrashReporterKitTests/
│       └── CrashReporterKitTests.swift   # Unit tests
└── README.md
```

## 📄 License

This project is licensed under the **MIT License**.

You are free to use, modify, and distribute this library in your commercial or non-commercial projects.

See the [LICENSE](LICENSE) file for more details.

