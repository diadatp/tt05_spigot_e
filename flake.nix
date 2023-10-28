{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };
  outputs = inputs @ { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          # metals
          gtkwave
          python3
          python3Packages.numpy
          python3Packages.pip
          python3Packages.scipy
          sbt
          scalafmt
          verible
          verilator
          verilog
          yosys
          zlib
        ];
        runScript = "bash";
        shellHook = ''
          SOURCE_DATE_EPOCH=$(date +%s)
          VENV=.venv
          if test ! -d $VENV; then
            python3 -m venv $VENV
          fi
          source ./$VENV/bin/activate
          pip install teroshdl
        '';
      };
    };
}
