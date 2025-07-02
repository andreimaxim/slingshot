// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser
import SlingshotKit

@main
struct Slingshot: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "slingshot",
        abstract: "A robust reverse proxy for developer environments"
    )
    
    @Option(name: .shortAndLong, help: "Port to listen on", transform: { str in
        guard let value = Int(str) else {
            throw ValidationError("Invalid port value")
        }
        return value
    })
    var port: Int = 5000
    
    @Option(name: .shortAndLong, help: "Port to forward requests to")
    var forwardingPort: Int = 3000
    
    @Flag(name: .shortAndLong, help: "Enable verbose logging")
    var verbose: Bool = false
    
    mutating func run() throws {
        print("Slingshot v\(SlingshotKit.version)")
        print("Listening on port \(port)")
        if verbose {
            print("Verbose logging enabled")
        }
    }
}
