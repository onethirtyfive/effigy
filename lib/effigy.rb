require 'effigy/wire'

module Effigy
  MAGIC            = "PBDEMS2\0"
  COMPRESSION_MASK = Wire::EDemoCommands::DEM_ISCOMPRESSED_S2.to_i
end

path = File.join(__dir__, 'effigy', '*.rb')
