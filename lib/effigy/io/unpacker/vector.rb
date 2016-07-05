path = File.join(__dir__, 'vector', '*.rb')
Dir[path].each { |file| require file }
