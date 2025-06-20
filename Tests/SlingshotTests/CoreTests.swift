import Testing
@testable import Slingshot

@Test("run executes successfully with default config")
func testRunDefault() {
    // Test that the run function can be called without throwing
    run()
    // Test passes if no exception is thrown
}

@Test("run executes successfully with custom config")
func testRunCustom() {
    let config = Config(port: 8080, configPath: nil, verbose: false)
    run(config: config)
    // Test passes if no exception is thrown
}