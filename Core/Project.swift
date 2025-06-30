import ProjectDescription

let project = Project(
  name: "Core",
    settings: .settings(
    base: [
      "ENABLE_USER_SCRIPT_SANDBOXING": "YES",
      "ENABLE_MODULE_VERIFIER": "YES",
      "MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS": "gnu11 gnu++14",
    ]
  ),
  targets: [
    .target(
      name: "Core",
      destinations: [.iPad, .iPhone, .mac],
      product: .framework,
      bundleId: "net.4rays.Core",
      deploymentTargets: .multiplatform(iOS: "18.0", macOS: "15.0"),
      sources: ["Sources/**"],
      dependencies: [
        .external(name: "ComposableArchitecture"),
        .external(name: "Dependencies"),
        .external(name: "DependenciesMacros"),
        .external(name: "GRDB"),
        .external(name: "JWTAuth"),
        .external(name: "LoggingClient"),
        .external(name: "Algorithms"),
      ]
    )
  ]
)
