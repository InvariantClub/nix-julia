{ inputs, ... }:
with inputs; {
  perSystem =
    { lib
    , system
    , ...
    }:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          # Note: Not using Julia 1.12 as Pluto doesn't support it yet.
          (julia_111.withPackages [
            "Plots"
            "PlotThemes"
            "Pluto"
          ])
        ];
      };
    };
}
