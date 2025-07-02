import Testing
import ArgumentParser
@testable import slingshot

struct SlingshotTests {
    @Test func testDefaultPorts() throws {
        let command = try Slingshot.parse([])
        #expect(command.port == 5000)
        #expect(command.forwardingPort == 3000)
    }
    
    @Test func testCustomPort() throws {
        let command = try Slingshot.parse(["--port", "8080"])
        #expect(command.port == 8080)
    }
    
    @Test func testInvalidPortValue() throws {
        #expect(throws: Error.self) {
            _ = try Slingshot.parse(["--port", "foo"])
        }
    }
}