import ArgumentParser
import Slingshot

struct SlingshotCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "slingshot",
        abstract: "A cross-platform HTTP reverse proxy for development environments",
        version: "1.0.0"
    )
    
    @Option(name: .shortAndLong, help: "Port to listen on")
    var port: Int = 80
    
    @Option(name: .shortAndLong, help: "Configuration file path")
    var config: String?
    
    @Flag(name: .shortAndLong, help: "Enable verbose logging")
    var verbose: Bool = false
    
    func run() throws {
        let slingshotConfig = Config(
            port: port,
            configPath: config,
            verbose: verbose
        )
        
        Slingshot.run(config: slingshotConfig)
    }
}

SlingshotCommand.main()
