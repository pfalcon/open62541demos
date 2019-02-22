BOARD=qemu_x86

# This script assumes build-all-zephyr.sh was run already

# Run Zephyr app in QEMU
make -f Makefile.zephyr BOARD=$BOARD run
