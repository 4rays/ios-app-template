import ProjectDescription

let project = Project(
  name: "ModuleTemplate",
    settings: .settings(
    base: [
      "ENABLE_USER_SCRIPT_SANDBOXING": "YES",
      "ENABLE_MODULE_VERIFIER": "YES",
      "MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS": "gnu11 gnu++14",
    ]
  ),
  targets: [
    .target(
      name: "ModuleTemplate",
      destinations: [.iPad, .iPhone, .macCatalyst],
      product: .framework,
      bundleId: "net.4rays.ModuleTemplate",
      deploymentTargets: .iOS("18.0"),
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
