# gHub-GUI

Manage your logitech device on Linux using GUI.
The program is lightweight and user-friendly.

> [!NOTE]
> This is a project to develop a lightweight and user-friendly [G Hub](https://www.logitechg.com/en-us/innovation/g-hub.html) alternative for linux users.

> [!WARNING]
> This is still a work in progress and a lot of features are either missing or unstable, see [the features section](#features) of this document to know what is supported or not.  
> Use this software at your own risk.

## Dependencies

To compile this tool, you need to install the required dependencies listed below.

Ubuntu/Debian:

```bash
sudo apt-get install libusb-1.0-0-dev libx11-dev libgl-dev
```

Fedora (38):

```bash
sudo dnf install libusb1-devel libX11-devel mesa-libGL-devel
```

## How to compile

To compile this project you just need to do:

```bash
cd gHub-GUI && make
```

or

```bash
cd gHub-GUI && make all
```

## How to use

As this project requires you to run as a user with root privileges (i.e. administrator privileges), do:

```bash
sudo ./ghub-gui
```

> [!NOTE]
> The user running this command needs to be in the sudoers list.
>
> For more information on how to add a user to the sudoers list, see the [Ubuntu Community Wiki](https://help.ubuntu.com/community/RootSudo) page for Ubuntu/Debian users or the [Fedora Documentation](https://docs.fedoraproject.org/en-US/quick-docs/adding_user_to_sudoers_file/) page for the RHEL/Fedora users.

## How to uninstall / clean up

During the installation process, only the executable is created.

To uninstall this project, you just need to delete this folder (`gHub-GUI`).

If you want to clean up the executable while keeping this project on your disk, please do:

```bash
make clean
```

## Troubleshooting

### My device stopped working after executing this program

What may have caused this issue is your kernel failing to attach the driver (You might see a "can't add hid device" message in `dmesg`).  

How to solve:

<!--Not sure about this method of solving this issue-->
- Execute this program once again (one failed attempt doesn't necessarily means all attempts will fail)
- Switch the USB port your device is currently connected

> [!NOTE]
> If the issue persists, you can try to add the udev rules listed in the `How to run this program without root privileges` section, available [here](#how-to-run-this-program-without-root-privileges).


### How to run this program without root privileges?

> [!CAUTION]
> As this program works with drivers and your kernel, it is recommended to run it as a
> user with root privileges, however it is possible to run this program without root privileges.

create a rule in /etc/udev/rules.d/:

```bash
printf 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="plugdev"\nSUBSYSTEM=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c083", GROUP="ubuntu", MODE="066"\nSUBSYSTEM=="usb_DEVICE", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c083", GROUP="ubuntu", MODE="066"' | sudo tee /etc/udev/rules.d/99-hidraw-permission.rules
```

If rules fail to reload automatically:

```bash
sudo udevadm control --reload
```

To manually force udev to trigger your rules:

```bash
sudo udevadm trigger
```
Reboot may also be needed.  

Links regarding udev rules:  
[udev homepage](http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev/udev.html)  
[Debian's udev overview](http://wiki.debian.org/udev)  
[Arch's udev overview](https://wiki.archlinux.org/index.php/udev)  
[Writing udev rules](http://www.reactivated.net/udevrules.php)  
[Ask about udev on the forum](http://vger.kernel.org/vger-lists.html#linux-hotplug)  

### My device is UNIDENTIFIED, what could that be?
Some logitech devices use the same id for bluetooth receiver.  
However, the Linux kernel since version of 5.2 may recognize IDs properly.  
Possible solution for debian-based distributions would be:  

```bash
sudo apt-get upgrade
```

## Features

This is the list of all supported or unsupported features by this project.

| Feature                            |     Supported      |
| ---------------------------------- | :----------------: |
| Static LED color (primary or logo) | :white_check_mark: |
| Custom LED colors                  |        :x:         |
| Set Cycle or breathing             |        :x:         |
| Set LED color (primary or logo)    |        :x:         |
| Set Mouse DPI                      |        :x:         |
| Set report rate                    |        :x:         |
| Report Battery level               |        :x:         |
| Comprehensive GUI                  |        :x:         |
