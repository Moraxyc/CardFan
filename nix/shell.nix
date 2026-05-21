{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default =
        let
          androidComposition = pkgs.androidenv.composeAndroidPackages {
            buildToolsVersions = [
              "36.0.0"
            ];
            platformVersions = [
              "36.1" # Android 16 QPR2
            ];
            abiVersions = [
              "arm64-v8a"
            ];
          };
          androidSdk = androidComposition.androidsdk;
        in
        pkgs.mkShell {
          ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
          buildInputs = with pkgs; [
            flutter
            androidSdk
            zulu25
          ];
        };
    };
}
