{ pkgs, ... }:
with pkgs;
mkShell {
	buildInputs = [ yarn yarn2nix ];
	shellHook = ''
		export PS1="|$(basename `git rev-parse --show-toplevel`) : $(git branch --no-color --show-current)>"$PS1
		export NIX_PATH=nixpkgs=${pkgs.path}
	'';
}
