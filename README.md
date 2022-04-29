ZMK firmware for TBK Mini
==========================

Official repository for the TBK Mini: https://github.com/Bastardkb/TBK-Mini.

This is my attempt at firmware for a TBK Mini running on nice!nano v2s.

~~There's nothing in the personal config right now, but once I get the
keyboard working I'll put my keymap in there.~~

Working and now typing at a blazing 55 WPM. Working on my keymap.


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

![My TBK Mini](/my_tbk.jpg)
