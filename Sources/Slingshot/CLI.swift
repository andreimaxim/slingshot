import ArgumentParser

// MARK: - CLI Namespace

public enum CLI {
    
    public struct Command: ParsableCommand {
        public static let configuration = CommandConfiguration(
            commandName: "slingshot",
            abstract: "A cross-platform HTTP reverse proxy for development environments",
            version: "1.0.0"
        )
        
        @Option(name: .shortAndLong, help: "Port to listen on")
        public var port: Int = 80
        
        @Option(name: .shortAndLong, help: "Configuration file path")
        public var config: String?
        
        @Flag(name: .shortAndLong, help: "Enable verbose logging")
        public var verbose: Bool = false
        
        public init() {}
        
        public func run() throws {
            let slingshotConfig = Config(
                port: port,
                configPath: config,
                verbose: verbose
            )
            
            Slingshot.run(config: slingshotConfig)
        }
    }
}