{ username, ... }:

{
  home.file = {
    ".codex/skills/nixos-wsl-workstation".source = ../../skills/nixos-wsl-workstation;

    ".codex/config.toml".text = ''
      model = "gpt-5.5"
      model_reasoning_effort = "xhigh"

      [projects."/home/${username}"]
      trust_level = "trusted"

      [projects."/home/${username}/tooling"]
      trust_level = "trusted"
    '';
  };
}
