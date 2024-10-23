#! /bin/bash

cleanup() {
    rm -r config
    rm -r tbk_mini
}

cp -r ../config .
cp -r ../tbk_mini .
docker run -v "$(pwd)/config:/config:ro" -v "$(pwd)/tbk_mini:/zmk/app/boards/shields/tbk_mini:ro" -v "./output:/output:rw" -it --rm zmk /bin/bash -c "
    source .venv/bin/activate
    cd zmk/app 
    west build -p -b nice_nano_v2 -d build/left -- -DSHIELD=tbk_mini_left
    cp build/left/zephyr/zmk.uf2 /output/left.uf2
    west build -p -b nice_nano_v2 -d build/right -- -DSHIELD=tbk_mini_right
    cp build/left/zephyr/zmk.uf2 /output/right.uf2
"

trap cleanup EXIT
