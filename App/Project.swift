import ProjectDescription

let project = Project(
  name: "App",
  settings: .settings(
    base: [
      "ENABLE_USER_SCRIPT_SANDBOXING": "YES",
      "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": "YES",
    ],
    configurations: [
      .debug(name: "Debug", xcconfig: .relativeToRoot("Configs/Debug.xcconfig")),
      .release(name: "Release", xcconfig: .relativeToRoot("Configs/Release.xcconfig")),
    ]
  ),
  targets: [
    .target(
      name: "App-iOS",
      destinations: .iOS,
      product: .app,
      bundleId: "net.4rays.App",
      deploymentTargets: .iOS("18.0"),
      infoPlist: .extendingDefault(
        with: [
          "UILaunchScreen": [
            "UIColorName": "",
            "UIImageName": "",
          ]
        ]
      ),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "Core", path: .relativeToRoot("Core")),
        .project(target: "Components", path: .relativeToRoot("Components"))
      ],
      settings: .settings(
        base: [
          "OTHER_LDFLAGS": .string("-ObjC"),
          "CODE_SIGN_ENTITLEMENTS": .string("App.entitlements"),
          "INFOPLIST_KEY_CFBundleDisplayName": "$(DISPLAY_NAME)",
        ]
      )
    ),
    .target(
      name: "App-Mac",
      destinations: .macOS,
      product: .app,
      bundleId: "net.4rays.App",
      deploymentTargets: .macOS("15.0"),
      infoPlist: .extendingDefault(with: [:]),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "Core", path: .relativeToRoot("Core")),
        .project(target: "Components", path: .relativeToRoot("Components"))
      ],
      settings: .settings(
        base: [
          "OTHER_LDFLAGS": .string("-ObjC"),
          "CODE_SIGN_ENTITLEMENTS": .string("AppMac.entitlements"),
          "INFOPLIST_KEY_CFBundleDisplayName": "$(DISPLAY_NAME)",
        ]
      )
    )
  ],
  schemes: [
    .scheme(
      name: "App iOS Debug",
      shared: true,
      buildAction: .buildAction(targets: ["App-iOS"]),
      runAction: .runAction(
        configuration: "Debug",
        executable: "App-iOS"
      ),
      archiveAction: .archiveAction(configuration: "Debug"),
      profileAction: .profileAction(
        configuration: "Debug",
        executable: "App-iOS"
      ),
      analyzeAction: .analyzeAction(configuration: "Debug")
    ),
    .scheme(
      name: "App iOS",
      shared: true,
      buildAction: .buildAction(targets: ["App-iOS"]),
      runAction: .runAction(
        configuration: "Release",
        executable: "App-iOS"
      ),
      archiveAction: .archiveAction(configuration: "Release"),
      profileAction: .profileAction(
        configuration: "Release",
        executable: "App-iOS"
      ),
      analyzeAction: .analyzeAction(configuration: "Release")
    ),
    .scheme(
      name: "App macOS Debug",
      shared: true,
      buildAction: .buildAction(targets: ["App-Mac"]),
      runAction: .runAction(
        configuration: "Debug",
        executable: "App-Mac"
      ),
      archiveAction: .archiveAction(configuration: "Debug"),
      profileAction: .profileAction(
        configuration: "Debug",
        executable: "App-Mac"
      ),
      analyzeAction: .analyzeAction(configuration: "Debug")
    ),
    .scheme(
      name: "App macOS",
      shared: true,
      buildAction: .buildAction(targets: ["App-Mac"]),
      runAction: .runAction(
        configuration: "Release",
        executable: "App-Mac"
      ),
      archiveAction: .archiveAction(configuration: "Release"),
      profileAction: .profileAction(
        configuration: "Release",
        executable: "App-Mac"
      ),
      analyzeAction: .analyzeAction(configuration: "Release")
    ),
  ]
)
