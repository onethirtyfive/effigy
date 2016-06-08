require 'effigy/wire'
require 'effigy/engine'
require 'effigy/io'

File.open('2406641482.dem') do |demo|
  puts demo.read(Effigy::Engine::MAGIC.length)
  demo.read(8)
  consumer = Effigy::IO::Consumer.new(source: demo)

  loop do
    consumer.next_varint32!
    kind = consumer.out
    consumer.next_varint32!
    tick = consumer.out
    consumer.next_varint32!
    size = consumer.out
    demo.read(size)

    puts kind, tick, size
    puts
    sleep(0.6)
  end
end
