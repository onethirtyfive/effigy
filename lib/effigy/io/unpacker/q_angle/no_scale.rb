module Effigy
  module IO
    module Unpacker
      class NoScale
        def initialize
          @out = nil
        end

        def unpack!(bitstream:)
          bitstream.read_u_bit_int!
          a = Float.no_scale(uint32: bitstream.out)

          bitstream.read_u_bit_int!
          b = Float.no_scale(uint32: bitstream.out)

          bitstream.read_u_bit_int!
          c = Float.no_scale(uint32: bitstream.out)

          @out = Vector.new(a, b, c)

          nil
        end
      end
    end
  end
end
