avburn
======

Simple Shoes GUI for AVRDUDE. Burn fuses/hexes.


Install
-------

    gem install avburn


Use
---

    avburn


Requirements
------------

* Shoes
* Avrdude


HexFiles
--------

Copy yr firmware to ~/.avb.hex/ in this format (optional):

name_mcu_freq.hex

Example:

cp compiled.hex ~/avb.hex/myproj_atmega328p_16mhz.hex


SS
--
![SS](https://github.com/nofxx/avburn/raw/master/media/ss.png)


ToDo
----

More devices on fuse.yml...
Your ideas...