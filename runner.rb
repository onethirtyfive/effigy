require 'effigy'

File.open('2420459941.dem', 'rb') do |demo|
  consumer = Effigy::IO::Consumer.new(source: demo)

  consumer.next_bytes!(Effigy::MAGIC.length)
  consumer.next_bytes!(8)

  begin
    loop do
      consumer.next_varint32!;
      raw_kind   = consumer.out
      kind       = raw_kind & ~Effigy::COMPRESSION_MASK
      decompress = (raw_kind & Effigy::COMPRESSION_MASK) > 0

      consumer.next_varint32!
      tick = consumer.out

      consumer.next_varint32!
      size = consumer.out

      consumer.next_bytes!(
        size,
        decompress: decompress
      )
      payload = consumer.out

      klass = Effigy::Lookup::DEMO_PACKETS.fetch(kind)
      msg   = klass.decode(payload)
    end
  rescue EOFError
  end
end
