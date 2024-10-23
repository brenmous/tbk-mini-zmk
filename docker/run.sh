#! /bin/bash

cleanup() {
    rm -r config
    rm -r tbk_mini
}

rm -r output
cp -r ../config .
cp -r ../tbk_mini .
docker run -v "$(pwd)/config:/config:ro" -v "$(pwd)/tbk_mini:/zmk/app/boards/shields/tbk_mini:ro" -v "./output:/output:rw" -it --rm zmk /bin/bash -c "
    source .venv/bin/activate
    cd zmk/app 
    west build -p -b nice_nano_v2 -d build/left -- -DSHIELD='nice_view_adapter tbk_mini_left nice_view' -DZMK_CONFIG=/config
    cp build/left/zephyr/zmk.uf2 /output/left.uf2
    west build -p -b nice_nano_v2 -d build/right -- -DSHIELD='nice_view_adapter tbk_mini_right nice_view' -DZMK_CONFIG=/config
    cp build/right/zephyr/zmk.uf2 /output/right.uf2
"
sudo chown -R "$USER" output

trap cleanup EXIT
