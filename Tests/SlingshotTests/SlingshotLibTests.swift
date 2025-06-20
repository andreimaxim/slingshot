import Testing
@testable import Slingshot

@Test("Config can be created with defaults")
func testConfigDefaults() {
    let config = Config()
    #expect(config.port == 80)
    #expect(config.configPath == nil)
    #expect(config.verbose == false)
}

@Test("Config can be created with custom values")
func testConfigCustom() {
    let config = Config(port: 3000, configPath: "/path/to/config", verbose: true)
    #expect(config.port == 3000)
    #expect(config.configPath == "/path/to/config")
    #expect(config.verbose == true)
}

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

@Test("CLI namespace exists")
func testCLINamespaceExists() {
    // Test that the CLI namespace exists
    #expect(CLI.self != nil)
}