{ inputs, ... }:
{
  imports = [ inputs.git-hooks-nix.flakeModule ];

  perSystem = {
    pre-commit = {
      check.enable = true;
      settings.hooks = {
        # formatter
        treefmt = {
          enable = true;
          settings = {
            fail-on-change = false;
          };
        };
        # flutter
        dart-analyze.enable = true;
        flutter-i10n = {
          enable = true;
          entry = "flutter gen-l10n";
          pass_filenames = false;
        };
        # security
        trufflehog.enable = true;
        # nix
        flake-checker.enable = true;
      };
    };
  };
}
