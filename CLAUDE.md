# CLAUDE.md

## Project Overview

Slingshot is a single threaded reverse proxy for developer environments,
written in idiomatic Swift.

## Development Commands

### Building and Testing

```bash
# Build the project
swift build

# Build with verbose output
swift build --verbose

# Run tests (uses Swift Testing framework, not XCTest)
swift test --disable-xctest
  
# Run tests with verbose output
swift test --verbose

# Build for release
swift build -c release

# Run the CLI tool directly
swift run slingshot --help
swift run slingshot --port 8080 --verbose
```

### Single Test Execution

```bash
# Run specific test function
swift test --filter testConfigDefaults
```

## Key Technical Details

- **Swift Version**: 6.1 minimum (specified in Package.swift)
- **Testing Framework**: Swift Testing (NOT XCTest) - use `#expect()` not `XCTAssert*()`
- **CLI Framework**: Swift ArgumentParser for command-line interface
- **Package Structure**: Library + executable target pattern for reusable CLI tools
- **CI**: GitHub Actions with Swift 6.1 on Ubuntu

## Development Workflow

After writing a test, write the least amount of code to make the test pass.
Once the test passes, run the entire suite and fix any tests by writing only
the amount of code that makes all the tests pass.