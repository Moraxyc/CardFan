{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default =
        let
          buildToolsVersion = "35.0.0";
          androidComposition = pkgs.androidenv.composeAndroidPackages {
            buildToolsVersions = [
              buildToolsVersion
            ];
            platformVersions = [
              "36" # Android 16
              "35"
            ];
            abiVersions = [
              "arm64-v8a"
            ];
            ndkVersions = [ "28.2.13676358" ];
            includeNDK = true;
            cmakeVersions = [ "3.22.1" ];
            includeCmake = true;
          };
          androidSdk = androidComposition.androidsdk;
        in
        pkgs.mkShellNoCC {
          env = {
            ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
            ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
            GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/${buildToolsVersion}/aapt2";

            CMAKE_INSTALL_PREFIX = "build/linux/x64/debug/bundle";
          };
          nativeBuildInputs = with pkgs; [
            pkg-config
            ninja
          ];
          buildInputs =
            with pkgs;
            [
              flutter
              androidSdk
              zulu21
              gradle_9

            ]
            ++ lib.optionals stdenv.hostPlatform.isLinux [
              libsecret.dev
            ]
            ++ lib.optionals stdenv.hostPlatform.isDarwin [
              cocoapods
            ];
        };
    };
}
