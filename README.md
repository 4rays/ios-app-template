# Indigo Stack 🔵🟣 Apple Platforms

## Getting Started

The Indigo stack uses [Tuist](https://tuist.dev/) for organizing and managing
the project structure, dependencies, and build settings for Apple platform applications.

### Setup

1- Install Tuist by running:

```sh
curl https://mise.jdx.dev/install.sh | sh
mise install
```

This will install the Mise tool which manages Tuist versions, and then install
the specific Tuist version for this project based on the `.mise.toml` file.

2- Install project dependencies by running:

```sh
tuist install
```

This will fetch and install all Swift Package Manager dependencies defined in
the project's `Package.swift`.

3- Generate the Xcode project by running:

```sh
tuist generate
```

This will generate the Xcode project and workspace from the Tuist project models.

You can now open `App.xcworkspace` in Xcode and build/run the project.

#### Update Tuist Version

If you need to update the Tuist version, you can run:

```sh
mise up --bump
```

## Project Architecture

This project is organized into three main modules:

- **App**: The main iOS/macOS application targets that depend on both Core and Components
- **Core**: Business logic, data models, and external dependencies (ComposableArchitecture, GRDB, etc.)
- **Components**: Reusable SwiftUI components with no external dependencies for maximum portability

### Dependency Graph

```
App
├── Core (business logic + external dependencies)
└── Components (reusable UI components, no dependencies)
```

This architecture ensures that:

- UI components remain reusable across different projects
- Business logic is separated from presentation
- External dependencies are contained within the Core module

### Project Settings

- `OTHER_LDFLAGS` is set to `-ObjC` to allow Objective-C dependencies.

### Updating Dependencies

If you make changes to the `Package.swift` to add/update dependencies, re-run:

```sh
tuist install
tuist generate
```

### Editing Project Models

If you make changes to the Tuist project models (e.g. adding a new target), re-run to generate the Xcode project:

```sh
tuist generate
```

### Targets

The project contains the following targets:

#### Target: App

- **Type**: iOS/macOS Application
- **Deployment Target**: iOS 18.0, macOS 15.0
- **Dependencies**:
  - Core (business logic and data layer)
  - Components (reusable UI components)

#### Target: Core

- **Type**: Framework
- **Deployment Target**: iOS 18.0, macOS 15.0
- **Purpose**: Contains business logic, data models, and external dependencies
- **Dependencies**:
  - ComposableArchitecture
  - Dependencies
  - GRDB
  - JWTAuth
  - LoggingClient
  - Algorithms

#### Target: Components

- **Type**: Framework
- **Deployment Target**: iOS 18.0, macOS 15.0
- **Purpose**: Reusable SwiftUI components with no external dependencies
- **Dependencies**: None (intentionally kept dependency-free for maximum reusability)

### Schemes

The project includes the following schemes:

#### Scheme: App Debug

- **Configuration**: Debug
- **Purpose**: Development and debugging
- All actions (Run, Archive, Profile, Analyze) use the Debug configuration

#### Scheme: App

- **Configuration**: Release
- **Purpose**: Production builds
- All actions (Run, Archive, Profile, Analyze) use the Release configuration
