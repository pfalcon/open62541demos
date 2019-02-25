set -ex

# Generate various config files, as required for build process
make -f Makefile.zephyr prepare "$@"

# Build open62541
./build-open62541-zephyr.sh

# Build Zephyr code and link Zephyr application
make -f Makefile.zephyr "$@"

# Use run-zephyr-qemu.sh to run sample in QEMU
