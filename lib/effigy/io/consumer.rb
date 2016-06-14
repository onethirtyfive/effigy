require 'snappy'

module Effigy
  module IO
    class Consumer
      MalformedVarint = Class.new(RuntimeError)
      
      attr_reader :out

      def initialize(source:)
        @source = source
        @out    = nil
      end

      def next_bytes!(n, decompress: false)
        buffer = @source.read(n)
        @out   = !!decompress ? Snappy.inflate(buffer)
                              : buffer

        nil
      end

      def next_varint32!
        acc = 0

        5.times do |i|
          byte  = @source.readbyte
          acc  |= (byte & 0x7f) << 7 * i
          if (byte & 0x80).zero?
            @out = acc
            return
          end
        end

        raise MalformedVarint
      end
    end
  end
end
