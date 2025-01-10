{ colorScheme, lib, ... }:
{
  imports = [
    ./options.nix
    ./visual.nix
    ./binds.nix
    ./picker.nix
    ./languages
    ./notes
    ./bone.nix
  ];

  _module.args.colorScheme' = lib.attrsets.mapAttrs (_: value: "#${value}") colorScheme.palette;

  vim = {
    viAlias = true;
    vimAlias = true;
    enableLuaLoader = true;
  };
}
