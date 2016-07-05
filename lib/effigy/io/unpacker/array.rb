module Effigy
  module IO
    module Unpacker
      class Array
        attr_reader :out

        def initialize(unpacker:, n_size_bits:)
          @unpacker    = unpacker
          @n_size_bits = n_size_bits
          @out         = nil
        end

        def unpack!(bitstream:)
          bitstream.read_u_bit_int!(n_size_bits: @n_size_bits)
          count = bitstream.out

          @out =
            1.upto(count).map do
              @unpacker.unpack!(bitstream)
              out << @unpacker.out
            end

          nil
        end
      end
    end
  end
end
