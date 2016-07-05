path = File.join(__dir__, 'string', '*.rb')
Dir[path].each { |file| require file }
