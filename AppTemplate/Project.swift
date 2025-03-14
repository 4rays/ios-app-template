import ProjectDescription

let project = Project(
  name: "AppTemplate",
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
      name: "AppTemplate",
      destinations: .iOS,
      product: .app,
      bundleId: "net.4rays.AppTemplate",
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
        .project(target: "ModuleTemplate", path: .relativeToRoot("ModuleTemplate"))
      ],
      settings: .settings(
        base: [
          "OTHER_LDFLAGS": .string("-ObjC"),
          "CODE_SIGN_ENTITLEMENTS": .string("AppTemplate.entitlements"),
          "INFOPLIST_KEY_CFBundleDisplayName": "$(DISPLAY_NAME)",
        ]
      )
    )
  ],
  schemes: [
    .scheme(
      name: "AppTemplate Debug",
      shared: true,
      buildAction: .buildAction(targets: ["AppTemplate"]),
      runAction: .runAction(
        configuration: "Debug",
        executable: "AppTemplate"
      ),
      archiveAction: .archiveAction(configuration: "Debug"),
      profileAction: .profileAction(
        configuration: "Debug",
        executable: "AppTemplate"
      ),
      analyzeAction: .analyzeAction(configuration: "Debug")
    ),
    .scheme(
      name: "AppTemplate",
      shared: true,
      buildAction: .buildAction(targets: ["AppTemplate"]),
      runAction: .runAction(
        configuration: "Release",
        executable: "AppTemplate"
      ),
      archiveAction: .archiveAction(configuration: "Release"),
      profileAction: .profileAction(
        configuration: "Release",
        executable: "AppTemplate"
      ),
      analyzeAction: .analyzeAction(configuration: "Release")
    ),
  ]
)
