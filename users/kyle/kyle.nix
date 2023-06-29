{ config, pkgs, lib, ... }: {

  users.users = {
    kyle = {
      uid = 1000;
      home = "/home/kyle";
      name = "kyle";
      group = "kyle";
      extraGroups = [ "wheel" ];
      passwordFile = config.sops.secrets."password".path;
    };
  };

  users.extraUsers.kyle.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZVyL80CpitMD2Gj3RdvoHguAOPElpFLCKgC+MCzlTJQNj9jE0iFv6QGPA2+yD6szWUBXz9QwvsJGTvNEucC7x1TK6iG8uUIXqU47lYg1f/nTLWuinKfbGHU02Lp+EqQ6YslU6wtbjjCpIxNm5/WSNrM3BVKBZLrmWQYqIM3NoKVypWYnAfi1GgC+HkhgQ7j5FYwVmF1w02eO2Z8zhOx0DA3OVbEHu8oXrg7KlpWnp6Glb4w+Wxje3RrreKmCukIkZpTvAA60Gwbu4ha/gdSP39UEGB+mvl0sNvSoAAsDQUbfk8DYF3uyVTuBgcuui7J21c524MTCb2VOddWIHQU3dwUOtyyYoSFypRl32DVZmsmA8WM5LK0eW4F1KedZGL/CBxBeZ4K3MHtdia0tl2TCaNtOHfYCDr6CTS+5/+P6gBwhQVfKIEZJi8exTMvexDkwQ0Or1/laVDFYjse6QoB5EUc3x3uzTbOJVZkYWCVAE26xpDflHO9aM5JgISJMuuPs= kyle.wilson@kyledev.co"
  ];
}
