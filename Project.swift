import ProjectDescription

let project = Project(
  name: "AppTemplate",
  targets: [
    .target(
      name: "AppTemplate",
      destinations: .iOS,
      product: .app,
      bundleId: "io.tuist.AppTemplate",
      infoPlist: .extendingDefault(
        with: [
          "UILaunchScreen": [
            "UIColorName": "",
            "UIImageName": "",
          ]
        ]
      ),
      sources: ["ios-app-template/Sources/**"],
      resources: ["ios-app-template/Resources/**"],
      dependencies: []
    ),
    .target(
      name: "AppTemplateTests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "io.tuist.AppTemplateTests",
      infoPlist: .default,
      sources: ["ios-app-template/Tests/**"],
      resources: [],
      dependencies: [.target(name: "AppTemplate")]
    ),
  ]
)
