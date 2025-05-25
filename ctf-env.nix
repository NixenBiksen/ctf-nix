{
  pkgs,
  ctf-python,
  seccomp-tools,
  pwntoolsGdb ? pkgs.gdb,
  pwndbg,
  ...
}:

let
  inner = pkgs.writeScript "ctf-env-inner" ''
    #!${pkgs.bash}/bin/bash

    set -eu -o pipefail

    if [ $# -ne 0 ]; then
      exec "$@"
    else
      exec "$SHELL"
    fi
  '';

in
pkgs.buildFHSEnv {
  name = "ctf-env";
  runScript = inner;
  targetPkgs =
    pkgs: [pwndbg] ++ (with pkgs; [
      bvi
      ctf-python
      gdb
      ltrace
      nasm
      one_gadget
      pwninit
      ropgadget
      seccomp-tools
      socat
      strace
      vim
    ]);
  multiPkgs =
    pkgs:
    (with pkgs; [
      libseccomp
      curl
      openssl
      fontconfig
      freetype
      glib
      xorg.libICE
      xorg.libSM
      xorg.libX11
      xorg.libXcursor
      xorg.libXrandr
      xorg.libXi
      xorg.libXext
      xorg.libXrender
      xorg.libXft
      openal
      SDL
      gtk3
      gtk3-x11
      zlib
      libpng12
      SDL2
      fuse
    ]);

  # This environment variable comes from the nix-shell-wrapper project, which can
  # be found here: https://github.com/NixenBiksen/nix-shell-wrapper
  #
  # It's purpose is to update your shell prompt to show that you are inside a the ctf-env
  profile = ''
    export NIX_SHELL_WRAPPER_DESCRIPTIONS="''${NIX_SHELL_WRAPPER_DESCRIPTIONS:+''${NIX_SHELL_WRAPPER_DESCRIPTIONS} }ctf-env";
  '';
}
