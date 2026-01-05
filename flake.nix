{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, ... }@inputs:
    {
      templates = {
        default = {
          description = "";
          path = ./default;
        };
      };
    };
}
