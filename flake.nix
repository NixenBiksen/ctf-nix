{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
    pwndbg.url = "github:pwndbg/pwndbg";
    pwndbg.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }@flakeArgs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        seccomp-tools = pkgs.callPackage ./seccomp-tools { };
        ctf-python = pkgs.callPackage ./ctf-python.nix { };
        pwndbg = flakeArgs.pwndbg.packages."${system}".pwndbg;
        ctf-env = pkgs.callPackage ./ctf-env.nix {
          inherit ctf-python seccomp-tools pwndbg;
        };
      in
      {
        checks = { inherit seccomp-tools ctf-python ctf-env; };
        packages = {
          inherit seccomp-tools ctf-python ctf-env pwndbg;
          default = ctf-env;
        };
      }
    );
}
