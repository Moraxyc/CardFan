{
  description = "CardFan";

  inputs = {
    nixpkgs.url = "git+https://github.com/nixos/nixpkgs.git?ref=nixpkgs-unstable&shallow=1";
    systems.url = "git+https://github.com/nix-systems/default.git?shallow=1";
    flake-parts = {
      url = "git+https://github.com/hercules-ci/flake-parts.git?ref=main&shallow=1";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./nix/overlay.nix
        ./nix/shell.nix
      ];
      systems = import inputs.systems;
    };
}
