{ lib, ... }:

let
  # Skills shared across agent runtimes. Each entry is linked into every
  # agent's skills directory below.
  skills = [
    "tooling"
    "zettelkasten"
  ];

  generalAgentInstructions = ''
    I am a machine learning researcher working on (Bayesian) deep learning (DL), specifically generative modeling in weight space, understanding weight (or posterior) samples as a data modality, DL architectures, and related fields.

    I organize notes on my research in a `zettelkasten` (see the skill).
    Please use it as well!

    I expect you to work independently on any given task.
    This also means we share this machine and need to be mindful on how to manage it (see the `tooling` skill).
  '';

  # Agent runtimes and the skills subdirectory each one reads.
  agents = {
    claude = ".claude/skills";
    codex = ".codex/skills";
  };

  skillLinks = skillsDir:
    lib.listToAttrs (map
      (skill: {
        name = "${skillsDir}/${skill}";
        value.source = ../../skills/${skill};
      })
      skills);
in
{
  home.file = lib.mkMerge ([
    {
      ".claude/CLAUDE.md".text = generalAgentInstructions;
      ".codex/AGENTS.md".text = generalAgentInstructions;
    }
  ] ++ lib.mapAttrsToList (_: skillLinks) agents);
}
