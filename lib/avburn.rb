
Avrdude = "avrdude"
AvrdudeConf = File.open("/etc/avrdude.conf").read
Avb = ENV["HOME"] + "/.avb"
Conf = {}


Memory = %w{ eeprom flash fuse efuse hfuse lfuse lock signature fuseN application apptable boot prodsig usersig }
Format = {
  :a => "Auto detect",
  :i => "Intel Hex",
  :s => "Motorola S-record",
  :r => "Raw binary",
  # :m => "Immediate",
  :d => "Decimal",
  :h => "Hexadecimal",
  :o => "Octal",
  :b => "Binary" }  #todo hash

FuseLabel = YAML.load(File.read(File.dirname(__FILE__) + "/avburn/fuses.yml"))
#  :attinyx5 => {
#     :hfuse => %w{RSTDISBL DWEN SPIEN WDTON EESAVE BOOTSZ0 BOOTSZ1 BOOTRST},
#     :lfuse => %w{CKDIB8 CKOUT SUT1 SUT0 CKSEL0 CKSEL1 CKSEL2 CKSEL3}
#   },
#   :atmega328p => {
#     :hfuse => %w{RSTDISBL DWEN SPIEN WDTON EESAVE BOOTSZ0 BOOTSZ1 BOOTRST},
#     :lfuse => %w{CKDIB8 CKOUT SUT1 SUT0 CKSEL0 CKSEL1 CKSEL2 CKSEL3}
#   },
#  :atmega32 => {
#     :hfuse => %w{OCDEN JTAGEN SPIEN CKOPT EESAVE BOOTSZ1 BOOTSZ0 BOOTRST},
#     :lfuse => %w{BODLEVEL BODEN SUT1 SUT0 CKSEL0 CKSEL1 CKSEL2 CKSEL3}
#   }

# }


module Avburn



end
