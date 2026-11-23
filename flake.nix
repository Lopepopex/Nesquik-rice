{
  description = "Nesquik Rice - NixOS and Hyprland desktop configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          git
          python3
          jq
          ripgrep
          nixfmt
          shellcheck
          shfmt
        ];

        shellHook = ''
          echo "Nesquik Rice development environment"
          echo "NixOS 26.05 | Hyprland"
        '';
      };
    };
}
