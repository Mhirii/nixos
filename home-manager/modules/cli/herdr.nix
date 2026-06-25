{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.herdr.packages.${pkgs.system}.default
  ];

  home.shellAliases = {
    h = "herdr";
  };
}
