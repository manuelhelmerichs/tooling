{ config, pkgs, ... }:

{
  home.file.".zshrc".source = pkgs.replaceVars ../dotfiles/zsh/zshrc {
    hmSessionVars = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
    nixZshCompletions = "${pkgs.nix-zsh-completions}/share/zsh/site-functions";
    zshAutosuggestions = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh";
    direnv = "${pkgs.direnv}/bin/direnv";
    zshSyntaxHighlighting = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
  };
}
