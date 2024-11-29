{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        seccomp-tools = pkgs.callPackage ./seccomp-tools { };
        ctf-python = pkgs.callPackage ./ctf-python.nix { };
        ctf-env = pkgs.callPackage ./ctf-env.nix { inherit ctf-python seccomp-tools; };
      in
      {
        checks = {
          inherit seccomp-tools ctf-python ctf-env;
        };
        packages = rec {
          inherit seccomp-tools ctf-python ctf-env;
          default = ctf-env;
        };
      }
    );
}
