{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
