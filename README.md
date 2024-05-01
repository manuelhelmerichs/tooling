
TODOS
- migrate dotfiles

so far:
1. installed Nix using Determinate Systems installer
2. created this repo
3. ran `nix run home-manager/release-23.11 -- init --switch ~/projects/tooling`

to update system:
`nix flake update`
`home-manager switch --flake ~/projects/tooling`

motivation

Because of Apple's ecosystem, switching to NixOS on bare metal does not make sense - system divergence is not a problem in a single user & single system setting - and nix-darwin is not mature yet! However, using NixOS as a virtual machine makes sense for some projects.

parasite/echo

Configured using https://github.com/Misterio77/nix-starter-configs as a template. Inspiration from: https://github.com/wegank/nixos-config and https://github.com/mitchellh/nixos-config - thank you!

pest control

If /boot/ full, run `sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +2' ; if needed: manually delete old kernels in /boot/nixos (check with btm) ; next rebuild will free up space in /boot!

host

see moving-to-nix for progression

tips:

man 5 configuration.nix | col -b | grep 'system\.defaults\.finder' for finding possible values
https://daiderd.com/nix-darwin/manual/index.html#sec-options for all darwin options
https://nix-community.github.io/home-manager/options.html for all home-manager options (services only work on Linux!)
inspo:

https://github.com/kclejeune/system/tree/master
