{ bundlerApp }:
# Made according to this guide: https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/ruby.section.md#packaging-applications-packaging-applications
#
# To update the version, run the following commands in this directory
#
# nix-shell -p bundix ruby
# bundle lock && bundix
bundlerApp {
  pname = "seccomp-tools";
  exes = [ "seccomp-tools" ];
  gemdir = ./.;
}
