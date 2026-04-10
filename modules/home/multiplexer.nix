{
  programs.tmux = {
    enable = true;
    mouse = false;
    keyMode = "vi";
    prefix = "C-b";
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 10000;

    extraConfig = ''
      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",*256col*:Tc"
    '';
  };
}
