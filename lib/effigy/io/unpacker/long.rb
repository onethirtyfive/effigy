path = File.join(__dir__, 'long', '*.rb')
Dir[path].each { |file| require file }
