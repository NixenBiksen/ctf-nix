# `ctf-nix`: A Collection of CTF-Related Tools for NixOS

`ctf-nix` is a set of nix packages and environments designed to enhance your Capture The Flag (CTF) experience on NixOS. This collection simplifies running CTF binaries, provides preconfigured Python environments, and includes tools for efficient binary analysis.

## Packages:

- `ctf-python`: A Python environment preconfigured with popular CTF-related packages such as `pwntools`, `z3`, and more.
- `ctf-env`: A traditional Linux-like environment based on `pkgs.buildFHSUserEnv`, designed to run CTF binaries that require a non-NixOS environment. It also integrates with the [`nix-shell-wrapper`](https://github.com/NixenBiksen/nix-shell-wrapper) to improve your workflow by setting the `NIX_SHELL_WRAPPER_DESCRIPTIONS` environment variable, which provides additional context inside your shell about the current environment.
- `seccomp-tools`: A Nix derivation for the open-source [`seccomp-tools`](https://github.com/david942j/seccomp-tools), useful for analyzing and understanding seccomp profiles in challenges.

---

## Usage

One easy way to use these tools is through `nix run`. This allows you to run packages directly from the GitHub repository without needing to modify your Nix configuration:

- To run the `ctf-env` package:

```bash
$ nix run github:NixenBiksen/ctf-nix
```

- To run the preconfigured `ctf-python` environment:

```bash
$ nix run github:NixenBiksen/ctf-nix#ctf-python
```

However, you can also integrate these packages more permanently into your workflow by adding them to your `flake.nix`, or by installing them globally or in specific environments as needed. This provides more flexibility in how you use and manage the tools.

---

## Contributing

If you encounter any issues or have ideas for new features, feel free to open a pull request or issue on the GitHub repository.

---

## License

This project is licensed under the [MIT License](./LICENSE).
