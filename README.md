# labrador-uboot-32
uboot for Caninos Labrador V2

@What is all about?
>This repository contains the source code of Labrador's 32bits uboot.

>Labrador Core Boards v2.x should work fine with this uboot!

@Where are the binaries?
>The compiled uboot can be found in the output folder.

@How to transfer the compiled uboot to my board/sdcard?
>Once you have the binaries, just execute the instructions below;

$ sudo dd if=/*source of binaries*/ of=/*destiny*/ bs=512 seek=66 status=progress

/*source of binaries*/ = /path to uboot'binaries/u-boot-dtb.img

Labrador's board mmc;

/*destiny*/ = /dev/mmcblk2
>example
$ sudo dd if=/home/caninos/Downloads/u-boot-dtb.img of=/dev/mmcblk2 bs=512 seek=66 status=progress

Sdcard;

/*destiny*/ = /system path to sdcard device/sdcard device

>example;

$ sudo dd if=/home/user/Downloads/u-boot-dtb.img of=/dev/sdb bs=512 seek=66 status=progress

@How to compile?
>Clone the git repository, go to the main path and run make from your favourite terminal.

$ make

After a successful build, the uboot should be avaliable at build-uboot/u-boot-dtb.img.

@Where are the main files?
>directory = u-boot/board/actions/owl

@where to find out more about Caninos Loucos and Labrador?

>Access the forum https://forum.caninosloucos.org.br/

>Access our site https://caninosloucos.org/pt/

>Acess the wiki https://wiki.caninosloucos.org.br/index.php


