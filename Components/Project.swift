import ProjectDescription

let project = Project(
  name: "Components",
    settings: .settings(
    base: [
      "ENABLE_USER_SCRIPT_SANDBOXING": "YES",
      "ENABLE_MODULE_VERIFIER": "YES",
      "MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS": "gnu11 gnu++14",
    ]
  ),
  targets: [
    .target(
      name: "Components",
      destinations: [.iPad, .iPhone, .mac],
      product: .framework,
      bundleId: "net.4rays.Components",
      deploymentTargets: .multiplatform(iOS: "18.0", macOS: "15.0"),
      sources: ["Sources/**"],
      dependencies: []
    )
  ]
)