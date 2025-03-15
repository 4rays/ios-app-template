import ProjectDescription

let project = Project(
  name: "ModuleTemplate",
  settings: .settings(),
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
