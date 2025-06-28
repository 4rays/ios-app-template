# iOS App Template

## Getting Started

This project uses [Tuist](https://tuist.dev/) to manage the project.

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

You can now open `AppTemplate.xcworkspace` in Xcode and build/run the project.

#### Update Tuist Version

If you need to update the Tuist version, you can run:

```sh
mise up --bump
```

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

#### Target: AppTemplate

- **Type**: iOS Application
- **Deployment Target**: iOS 18.0
- **Dependencies**:
  - ModuleTemplate (local module)

### Schemes

The project includes the following schemes:

#### Scheme: AppTemplate Debug

- **Configuration**: Debug
- **Purpose**: Development and debugging
- All actions (Run, Archive, Profile, Analyze) use the Debug configuration

#### Scheme: AppTemplate

- **Configuration**: Release
- **Purpose**: Production builds
- All actions (Run, Archive, Profile, Analyze) use the Release configuration
