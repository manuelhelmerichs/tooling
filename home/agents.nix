{ lib, ... }:

let
  agentInstructions = ../dotfiles/agents/instructions.md;

  # Skills shared across agent runtimes. Each entry is linked into every
  # agent's skills directory below.
  skills = [
    "mineru"
    "tooling"
    "zettelkasten"
  ];

  # Agent runtimes and the skills subdirectory each one reads.
  agents = {
    claude = ".claude/skills";
    codex = ".codex/skills";
  };

  skillLinks = skillsDir:
    lib.listToAttrs (map
      (skill: {
        name = "${skillsDir}/${skill}";
        value.source = ../skills/${skill};
      })
      skills);
in
{
  home.file = lib.mkMerge ([
    {
      ".claude/CLAUDE.md".source = agentInstructions;
      ".codex/AGENTS.md".source = agentInstructions;
    }
  ] ++ lib.mapAttrsToList (_: skillLinks) agents);
}
