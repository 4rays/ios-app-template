import ProjectDescription
import ProjectDescriptionHelpers

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
      name: appName.targetName,
      destinations: .destinations,
      product: .app,
      bundleId: "\(teamReverseDomain).\(appName.targetName)",
      deploymentTargets: .platforms,
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
        .project(target: "Components", path: .relativeToRoot("Components")),
        .project(target: "FeatureA", path: .relativeToRoot("FeatureA")),
        .project(target: "FeatureB", path: .relativeToRoot("FeatureB")),
      ],
      settings: .settings(
        base: [
          "OTHER_LDFLAGS": ["$(inherited)", "-ObjC"],
          "CODE_SIGN_ENTITLEMENTS[sdk=macosx*]": .string("mac.entitlements"),
          "CODE_SIGN_ENTITLEMENTS[sdk=iphoneos*]": .string("ios.entitlements"),
          "CODE_SIGN_ENTITLEMENTS[sdk=iphonesimulator*]": .string("ios.entitlements"),
          "INFOPLIST_KEY_CFBundleDisplayName": "$(DISPLAY_NAME)",
        ]
      )
    )
  ],
  schemes: [
    .scheme(
      name: "\(appName) Debug",
      shared: true,
      buildAction: .buildAction(targets: [appName]),
      runAction: .runAction(
        configuration: "Debug",
        executable: appName
      ),
      archiveAction: .archiveAction(configuration: "Debug"),
      profileAction: .profileAction(
        configuration: "Debug",
        executable: appName
      ),
      analyzeAction: .analyzeAction(configuration: "Debug")
    ),
    .scheme(
      name: "\(appName) Release",
      shared: true,
      buildAction: .buildAction(targets: [appName]),
      runAction: .runAction(
        configuration: "Release",
        executable: appName
      ),
      archiveAction: .archiveAction(configuration: "Release"),
      profileAction: .profileAction(
        configuration: "Release",
        executable: appName
      ),
      analyzeAction: .analyzeAction(configuration: "Release")
    ),
  ]
)
