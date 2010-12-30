
Avrdude = "avrdude"
AvrdudeConf = File.open("/etc/avrdude.conf").read
Avb = ENV["HOME"] + "/.avb"
Conf = {}
Fuses = [:hfuse, :lfuse, :efuse]

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
  def avr_bool(bit)
    bit.to_i.zero?
  end

  def run_comm(c)
    @log.text = ""
    comm = "#{Avrdude} -c #{Conf[:prog]} -p #{Conf[:platform]} "
    comm << "-P #{Conf[:port]} " if @port
    comm << "-U #{c}"
    log  "> Running #{comm}"
    Kernel.system "#{comm} &> output"
    log File.read("output")
  end

  class << self

    def read_conf
      `touch #{Avb}` unless File.exists?(Avb)
      Conf.merge! YAML.load(File.read(Avb)) || {}
    end

    def write_conf
      File.open(Avb, 'w') { |f| f << Conf.to_yaml }
    end

  end


end

class Part
  def self.all
    @parts ||= AvrdudeConf.scan(/part\s*\n\s*id\s*=\s*"(\w*)"\s*;/).flatten
  end

  def self.find(p)
    puts "search! #{p}"
  end
end


class Prog
  def self.all
    @progs ||= AvrdudeConf.scan(/programmer\n\s*id\s*=\s*"(\w*)"\s*;/).flatten
  end
end

class FuseStore < Hash
  attr_reader :hfuse, :lfuse, :efuse

  def hfuse
    [:hfuse]
  end

  def set(fuse, hex)
    hex = "0#{hex}" if hex.size == 1
    hex = hex[0,2]
    self[fuse.to_sym] =  Integer("0x#{hex}").to_s(2).rjust(8, "0").split(//)
    self["#{fuse}hex"] = hex
  end

  def set_bit(fuse, bit, bool)
    self[fuse][bit] = (bool ? "0" : "1")
    hexval = self[fuse].join.to_i(2).to_s(16).upcase
    hexval = "0#{hexval}" if hexval.size == 1
    self["#{fuse}hex"] = hexval
    hexval
  end
end


Avburn.read_conf
