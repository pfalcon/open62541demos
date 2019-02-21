open62541 proof-of-concept port to Zephyr
=========================================

This project showcases a proof of concept port of open62541, a library which
implements [OPC UA] (https://en.wikipedia.org/wiki/OPC_Unified_Architecture)
industrial communication/automation protocol, to Zephyr RTOS, using Zephyr's
POSIX subsystem. A sample Zephyr server-side application is included, allowing
access from a Linux client (`open62541ping` directory).

To build:

The steps below were tested with:

* [Zephyr SDK 0.9.5](https://github.com/zephyrproject-rtos/meta-zephyr-sdk/releases/tag/0.9.5)
* [Zephyr net-tools](https://github.com/zephyrproject-rtos/net-tools) revision 30b7efa827b04

Clone Zephyr tree with modifications required to build open62541 (the 
modifications are submitted for upstream review and inclusion):

    git clone https://github.com/pfalcon/zephyr -b zephyr-open62541

Follow [standard Zephyr instructions](https://docs.zephyrproject.org/1.13.0/getting_started/getting_started.html)
for setting up Zephyr build environment using the cloned tree. Note:
Zephyr 1.14 and above setup instruction are centered around Zephyr's
wrapper tool, `west`. This repository was tested using classic
instructions (`source zephyr-env.sh`, etc.).

Once done with Zephyr tree set up, back to this repository:

    git submodule update --init
    cd open62541ping
    ./build-all-zephyr.sh

Now you can run the server application in QEMU. Follow standard Zephyr
[instructions on setting up QEMU networking support](https://docs.zephyrproject.org/latest/subsystems/networking/qemu_setup.html),
then run:

    ./run-zephyr-qemu.sh

The application should start and print logging messages that it waits
for client connections.

Switch to another terminal window and `cd` to the project directory. Build
Linux client:

    cd open62541ping
    make

Run Linux client, observe it connect to Zephyr server running in QEMU, query
a variable and print its value:

```
the value is: 42

```
