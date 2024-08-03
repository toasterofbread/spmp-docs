{
  inputs = {
    # Hugo 0.119.0
    nixpkgs.url = "github:nixos/nixpkgs?ref=75a52265bda7fd25e06e3a67dee3f0354e73243c";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells."${system}".default =
        pkgs.mkShell {
          packages = with pkgs; [
            hugo
            go
          ];
        };
    };
}
