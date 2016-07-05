path = File.join(__dir__, 'unpacker', '*.rb')
Dir[path].each { |file| require file }
