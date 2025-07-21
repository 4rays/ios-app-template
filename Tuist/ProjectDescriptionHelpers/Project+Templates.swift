import ProjectDescription

extension Project {
  public static func framework(
    name: String,
    reverseDomain: String,
    tca: Bool = false,
    dependencies: [TargetDependency] = []
  ) -> Project {
    .init(
      name: name,
      settings: .settings(
        base: [
          "ENABLE_USER_SCRIPT_SANDBOXING": "YES",
          "ENABLE_MODULE_VERIFIER": "YES",
          "MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS": "gnu11 gnu++14",
        ]
      ),
      targets: [
        .target(
          name: name,
          destinations: [.iPad, .iPhone, .mac],
          product: .framework,
          bundleId: "\(reverseDomain).\(name)",
          deploymentTargets: .multiplatform(iOS: "18.0", macOS: "15.0"),
          sources: ["Sources/**"],
          dependencies: (tca
            ? [.project(target: "IndigoCore", path: .relativeToRoot("IndigoCore"))] : [])
            + dependencies
        ),
        .target(
          name: "\(name)Tests",
          destinations: [.iPad, .iPhone, .mac],
          product: .unitTests,
          bundleId: "\(reverseDomain).\(name)Tests",
          sources: ["Tests/**"]
        ),
      ]
    )
  }
}
