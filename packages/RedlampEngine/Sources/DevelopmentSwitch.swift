import Foundation

/// The environment variables that tune the engine's filters and choose its mask methods and models,
/// for tuning runs and the mask bench, which runs the Release CLI with them. The App Store build
/// reads none of them (ARC-26, guideline 2.3.1(a)): there every switch is unset, so each keeps its
/// default.
enum DevelopmentSwitch {
    /// The variable `name`'s value, or nil in the App Store build.
    static func value(_ name: String) -> String? {
        #if REDLAMP_APP_STORE
            nil
        #else
            ProcessInfo.processInfo.environment[name]
        #endif
    }
}
