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
      name: "App",
      destinations: [.iPad, .iPhone, .mac],
      product: .app,
      bundleId: "net.4rays.App",
      deploymentTargets: .multiplatform(iOS: "18.0", macOS: "15.0"),
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
      ],
      settings: .settings(
        base: [
          "OTHER_LDFLAGS": .string("-ObjC"),
          "CODE_SIGN_ENTITLEMENTS[sdk=macosx*]": .string("AppMac.entitlements"),
          "CODE_SIGN_ENTITLEMENTS[sdk=iphoneos*]": .string("App.entitlements"),
          "CODE_SIGN_ENTITLEMENTS[sdk=iphonesimulator*]": .string("App.entitlements"),
          "INFOPLIST_KEY_CFBundleDisplayName": "$(DISPLAY_NAME)",
        ]
      )
    )
  ],
  schemes: [
    .scheme(
      name: "App Debug",
      shared: true,
      buildAction: .buildAction(targets: ["App"]),
      runAction: .runAction(
        configuration: "Debug",
        executable: "App"
      ),
      archiveAction: .archiveAction(configuration: "Debug"),
      profileAction: .profileAction(
        configuration: "Debug",
        executable: "App"
      ),
      analyzeAction: .analyzeAction(configuration: "Debug")
    ),
    .scheme(
      name: "App Release",
      shared: true,
      buildAction: .buildAction(targets: ["App"]),
      runAction: .runAction(
        configuration: "Release",
        executable: "App"
      ),
      archiveAction: .archiveAction(configuration: "Release"),
      profileAction: .profileAction(
        configuration: "Release",
        executable: "App"
      ),
      analyzeAction: .analyzeAction(configuration: "Release")
    ),
  ]
)
