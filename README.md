ZMK firmware for TBK Mini
==========================

Official repository for the TBK Mini: https://github.com/Bastardkb/TBK-Mini.

This is my attempt at firmware for a TBK Mini running on nice!nano v2s.

Building
--------

I'm still pretty clueless about ZMK. I don't use the GitHub actions
build system (although after installing all the Zephyr dependencies I can
understand why it's there!) so here's how I do it:

- This assumes you've followed the instructions at https://zmk.dev/docs/development/setup
  to setup your build environment.
- Clone the zmk repo
- Copy the `tbk_mini` directory from the top level of this repo to `zmk/app/boards/shields`
- Build from within the `zmk/app` directory using: 
  `west build -p -b nice_nano_v2 -d build/left -- -DSHIELD=tbk_mini_left`
- Replace occurrences of 'left' with 'right' to build the right half
- The UF2 files will be at `zmk/app/build/<left|right>/zephyr/zmk.uf2`

Replace `nice_nano_v2` with your board name if you're using a different MCU.

Keymap
------

My keymap is in `config/tbk_mini.keymap`. 

You can compile the firmware with this (or your own config) by setting
the path to the `config` directory as the `-DZMK_CONFIG` build flag.

The keymap has a default layer, a function layer, a nav layer and
a hold-tap symbols layer.

The function layer contains the F keys, numbers and some layer toggles.

The nav layer contains arrows and nav (HOME, END etc.), and some media keys.

The symbols layer is activated by tapping the shift key.
A quick tap plus the necessary key(s) will output symbols,
e.g. tapping shift then 'W' and 'E' will give a pair
of parentheses.

![My TBK Mini](/my_tbk.jpg)
