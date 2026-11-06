import Foundation
import Testing
@testable import RedlampEngine

/// The engine's development switches are read in every build but the App Store's (ARC-26).
struct DevelopmentSwitchTests {
    @Test func `a development switch is read only outside the App Store build`() {
        // A name no other test sets or reads, since tests run in parallel in one process.
        let name = "REDLAMP_DEVELOPMENT_SWITCH_TEST"
        setenv(name, "on", 1)
        defer { unsetenv(name) }
        #if REDLAMP_APP_STORE
            #expect(DevelopmentSwitch.value(name) == nil)
        #else
            #expect(DevelopmentSwitch.value(name) == "on")
        #endif
        #expect(DevelopmentSwitch.value("REDLAMP_DEVELOPMENT_SWITCH_UNSET") == nil)
    }
}
