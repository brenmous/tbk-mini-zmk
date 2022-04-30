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
- Build using: `west build -p -b nice_nano_v2 -d build/left -- -DSHIELD=tbk_mini_left`
- Replace occurrences of 'left' with 'right' to build the right half
- The UF2 files will be at `zmk/app/build/<left|right>/zephyr/zmk.uf2`

I'm assuming ZMK allows you to swap "nice_nano_v2" with whatever MCU you have,
but I'm not sure if I've set it up correctly to allow that (or even if I do
need to do anything special).

Keymap
------

My keymap is in `config/tbk_mini.keymap`. 

You can compile the firmware with this (or your own config) by setting
the path to the `config` directory as the `-DZMK_CONFIG` build flag.

The keymap has a default layer, a function layer, a nav layer and
a hold-tab symbols layer.

The function layer contains the F keys, numbers and some media controls.
Future things (like layer toggles) I'd put in this layer as well.

The nav layer contains arrows and nav (HOME, END etc.).

The symbols layer is activated by tapping the hold-tap key (currently
the nav layer key). A quick tap plus the nessecary key(s) will output
symbols, e.g. tapping the nav key then 'W' and 'E' will give a pair
of parentheses. I used to run this on the shift key. The advantage of
that is I didn't have to move my thumb very much, but it does add a 
delay before you can hold shift and use it as a modifier. Having
it on the nav key leaves shift unmolested, but it does require moving
my thumb more (and retraining some muscle memory).

Todo:
- Add a game toggle that disables all the layer keys.
- Moving everything from the config layer to key combos on the
default layer (e.g. hold all thumb keys to enter bootloader).

![My TBK Mini](/my_tbk.jpg)
