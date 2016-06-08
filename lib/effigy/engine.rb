require 'effigy/wire'

module Effigy
  class Engine
    MAGIC            = "PBDEMS2\0"
    COMPRESSION_MASK = Wire::EDemoCommands::DEM_IsCompressed_S2.to_i
  end
end
