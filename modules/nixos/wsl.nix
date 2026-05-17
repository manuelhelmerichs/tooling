{ username, ... }:

{
  # VS Code's WSL extension downloads a generic Linux server whose bundled
  # Node binary expects /lib/ld-linux-aarch64.so.1. nix-ld provides that
  # compatibility loader on NixOS.
  programs.nix-ld.enable = true;

  wsl = {
    enable = true;
    defaultUser = username;
    startMenuLaunchers = false;

    interop = {
      includePath = false;
    };

    wslConf = {
      automount.root = "/mnt";
      boot.systemd = true;
      interop = {
        enabled = true;
        appendWindowsPath = false;
      };
      network.generateHosts = true;
      user.default = username;
    };
  };
}
