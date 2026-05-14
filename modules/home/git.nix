{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull.ff = "only";
      push = {
        autoSetupRemote = true;
        default = "simple";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      version = 1;
      git_protocol = "https";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
      };
    };
  };
}
