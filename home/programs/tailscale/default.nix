{ inputs, ... }: {
  home.packages = with inputs.nixpkgs-stable.legacyPackages.x86_64-linux; [tailscale tailscale-systray];
}