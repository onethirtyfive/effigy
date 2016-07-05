path = File.join(__dir__, 'io', '*.rb')
Dir[path].each { |file| require file }
