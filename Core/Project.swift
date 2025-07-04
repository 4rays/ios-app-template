import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.featureFramework(
  name: "Core",
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
