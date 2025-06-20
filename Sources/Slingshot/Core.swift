import Foundation

public func run(config: Config = Config()) {
    if config.verbose {
        print("Starting Slingshot HTTP Reverse Proxy...")
        print("Port: \(config.port)")
        if let configPath = config.configPath {
            print("Config file: \(configPath)")
        }
    }
    
    print("Hello from Slingshot! Ready to listen on port \(config.port)")
}