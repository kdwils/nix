{ config, pkgs, ... }: {

  networking.wireless.enable = true;
  networking.wireless.networks = {
    "${config.sops.secrets."ssid"}" = {
      psk = "${config.sops.secrets."ssid_psk"}";
    };
  };
}
