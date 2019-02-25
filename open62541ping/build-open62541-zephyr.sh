set -ex

source outdir/Makefile.export

cd open62541

mkdir -p BUILD
cd BUILD

export CC

# Set UA_LOGLEVEL=100 for debug logging
cmake -DCMAKE_C_COMPILER_WORKS=TRUE \
    -DCMAKE_C_FLAGS="$Z_CFLAGS" \
    -DCMAKE_AR="$AR" \
    \
    -DUA_LOGLEVEL=300 \
    -DUA_ENABLE_DISCOVERY_SEMAPHORE=0 \
    \
    -DUA_NAMESPACE_ZERO=MINIMAL \
    -DUA_BUILD_EXAMPLES=0 -DUA_ENABLE_AMALGAMATION=0 ..

make
