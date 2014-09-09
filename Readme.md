This is a buildroot-fork for RasPlayer, a Raspberry Pi based in-car music player.


# Build instructions
* Compilation takes about 1 hour 40 minutes. Note that ```-j``` should *not* be used, as buildroot handles parallel builds automatically.

```
    make rasplayer_defconfig
    make nconfig                    #Change root password
    time nice make
```

* Toolchain will be stored in ```output/host```, and rootfs will be in ```output/images```.

# Installation instructions
* Format an SD card to have 3 partitions:

| No. | Type  | Size   | Mount Point  | Instructions 
|-----|-------|--------|--------------|--------------
| 1   | FAT32 | 50 MB  | /boot        | Copy ```output/zImage``` and ```output/rpi-firmware/*``` here.
| 2   | None  | 100 MB | /            | Write ```output/images/rootfs.ext2``` here.
| 3   | ext2  | ------ | /media/music | Used for storing music.

# See Also
* Buildroot docs: http://buildroot.org/downloads/manual/manual.html

