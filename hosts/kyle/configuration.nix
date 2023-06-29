{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../services/networking/tailscale.nix
    ../services/networking/wifi.nix
    ../users/kyle/kyle.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/New_York";
  network.hostName = "kyle-nixos";

  boot.kernelParams = [ "cgroup_memory=1" "cgroup_enable=memory" ];
  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  system.stateVersion = "23.05";
}
