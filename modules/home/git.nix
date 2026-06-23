{
  programs.git = {
    enable = true;
    ignores = [
      ".DS_Store"
    ];
    settings = {
      user = {
        name = "manuelhelmerichs";
        email = "manuelhelmerichs@icloud.com";
      };
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
