import Testing
@testable import SlingshotKit

struct SlingshotKitTests {
    @Test func testVersion() {
        #expect(SlingshotKit.version == "0.1.0")
    }
}