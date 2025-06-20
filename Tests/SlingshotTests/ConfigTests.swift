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