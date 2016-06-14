require 'effigy/wire'

module Effigy
  MAGIC            = "PBDEMS2\0"
  COMPRESSION_MASK = Wire::EDemoCommands::DEM_ISCOMPRESSED_S2.to_i
end

Dir[File.join(File.dirname(__FILE__), 'effigy', '*.rb')].each do |file|
  require file
end
