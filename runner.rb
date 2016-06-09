require 'effigy/wire'
require 'effigy/engine'
require 'effigy/io'

module Effigy
  module Wire
    DEMO_PACKETS = {
      EDemoCommands::DEM_CLASSINFO.to_i => CDemoClassInfo,
      EDemoCommands::DEM_CONSOLECMD.to_i => CDemoConsoleCmd,
      EDemoCommands::DEM_CUSTOMDATA.to_i => CDemoCustomData,
      EDemoCommands::DEM_CUSTOMDATACALLBACKS.to_i => CDemoCustomDataCallbacks,
      EDemoCommands::DEM_FILEHEADER.to_i => CDemoFileHeader,
      EDemoCommands::DEM_FILEINFO.to_i => CDemoFileInfo,
      EDemoCommands::DEM_FULLPACKET.to_i => CDemoFullPacket,
      EDemoCommands::DEM_PACKET.to_i => CDemoPacket,
      EDemoCommands::DEM_SENDTABLES.to_i => CDemoSendTables,
      EDemoCommands::DEM_SIGNONPACKET.to_i => CDemoPacket,
      EDemoCommands::DEM_STRINGTABLES.to_i => CDemoStringTables,
      EDemoCommands::DEM_STOP.to_i => CDemoStop,
      EDemoCommands::DEM_SYNCTICK.to_i => CDemoSyncTick,
      EDemoCommands::DEM_USERCMD.to_i => CDemoUserCmd,
      EDemoCommands::DEM_SAVEGAME.to_i => CDemoSaveGame,
      EDemoCommands::DEM_SPAWNGROUPS.to_i => CDemoSpawnGroups
    }.freeze
  end
end

File.open('2406641482.dem') do |demo|
  demo.read(Effigy::Engine::MAGIC.length)
  demo.read(8)
  consumer = Effigy::IO::Consumer.new(source: demo)

  begin
    loop do
      consumer.next_varint32!
      kind = consumer.out
      compressed = (kind & Effigy::Engine::COMPRESSION_MASK) > 0
      puts compressed.inspect
      consumer.next_varint32!
      tick = consumer.out
      consumer.next_varint32!
      size = consumer.out
      demo.read(size)
    end
  rescue EOFError
  end

  puts demo.pos
end
