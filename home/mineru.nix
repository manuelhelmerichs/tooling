{ pkgs, ... }:

let
  mineruVersion = "3.4.3";
  mineruSpec = "mineru[all]==${mineruVersion}";

  mineruTool = command:
    pkgs.writeShellApplication {
      name = command;
      runtimeInputs = [ pkgs.uv ];
      text = ''
        export PYTORCH_ENABLE_MPS_FALLBACK=1
        exec uvx --python 3.12 --from '${mineruSpec}' ${command} "$@"
      '';
    };
in
{
  home.packages = map mineruTool [
    "mineru"
    "mineru-api"
    "mineru-gradio"
    "mineru-router"
    "mineru-models-download"
  ];
}
