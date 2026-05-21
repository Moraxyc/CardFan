{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { lib, pkgs, ... }:
    {
      treefmt = {
        projectRootFile = "pubspec.yaml";

        programs = {
          dart-format.enable = true;
          prettier.enable = true;
          nixfmt.enable = true;
          shfmt.enable = true;
          shellcheck.enable = true;
        };

        settings = {
          settings.formatter.dart-format = {
            command = lib.getExe' pkgs.flutter "dart";
          };
          global.excludes = [
            ".envrc"
            ".dart_tool/**"
            "build/**"
            "coverage/**"

            "**/*.g.dart"
            "**/*.freezed.dart"
            "**/*.gr.dart"
            "**/*.mocks.dart"

            ".flutter-plugins"
            ".flutter-plugins-dependencies"
            "android/.gradle/**"
            "ios/Pods/**"
            "macos/Pods/**"
          ];
        };
      };
    };
}
