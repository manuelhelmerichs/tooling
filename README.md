
TODOS
- migrate dotfiles
- migrate all user (!= cask) from brew -> homebrew should have only casks

so far:
1. installed Nix using Determinate Systems installer
2. created this repo
3. ran `nix run home-manager/release-23.11 -- init --switch ~/projects/tooling`

to update system:
`nix flake update`
`home-manager switch --flake ~/projects/tooling`
