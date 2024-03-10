{
	description = "A template for ixnay-based flakes";

	inputs = {
		nixpkgs = {
			url = "github:nixos/nixpkgs/nixos-unstable";
		};
		utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, utils, ... }: with self.lib; rec {
		lib = import ./lib { inherit (nixpkgs) lib; utils = utils.lib; };

		devShells = eachDefaultSystemMap (system: {
			default = nixpkgs.legacyPackages.${system}.callPackage ./shell.nix {};
		});

		pkgs = import nixpkgs {
			system = "x86_64-linux"; 
		};

		packages.x86_64-linux = { };
		modules = { };
  };
}