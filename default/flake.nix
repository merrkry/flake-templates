{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { self, ... }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      forAllSystems =
        mkFlakeOutput:
        inputs.nixpkgs.lib.genAttrs supportedSystems (
          system:
          mkFlakeOutput {
            pkgs = import inputs.nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forAllSystems (
        { pkgs }:
        {
          default = pkgs.mkShell {
            packages = with pkgs; [ ];

            env = { };

            shellHook = '''';
          };
        }
      );
    };
}
