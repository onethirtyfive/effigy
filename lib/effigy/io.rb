Dir[File.join(File.dirname(__FILE__), 'io', '*.rb')].each do |file|
  require file
end
