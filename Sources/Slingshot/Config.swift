import Foundation

// MARK: - Configuration

public struct Config {
    public let port: Int
    public let configPath: String?
    public let verbose: Bool
    
    public init(port: Int = 80, configPath: String? = nil, verbose: Bool = false) {
        self.port = port
        self.configPath = configPath
        self.verbose = verbose
    }
}