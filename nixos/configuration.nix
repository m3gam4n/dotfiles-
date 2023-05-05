{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";


#backlight no home-manager entry :c
programs.light.enable = true;

#enable ly display manager
 services.xserver = {
    enable = true;
    layout = "us";
    desktopManager.enlightenment.enable = true;
    displayManager.ly = {
      enable = true;
      defaultUser = "bjorn";
    };
  };


#enable virtualisation
virtualisation.libvirtd.enable = true;
programs.dconf.enable = true;

  users.users = {
    mega = {
      initialPassword = "TestPass123!";
      isNormalUser = true;
      extraGroups = [
      "wheel"
      "networkmanager"
      "sudo"
      "video"
      "nix"
      "libvirtd"
     ];
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
