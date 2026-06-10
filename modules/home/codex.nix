{ username, ... }:

{
  home.file = {
    ".claude/skills/tooling".source = ../../skills/tooling;

    ".codex/skills/tooling".source = ../../skills/tooling;

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
