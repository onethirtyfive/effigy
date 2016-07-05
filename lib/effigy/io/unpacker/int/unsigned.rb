module Effigy
  module IO
    module Unpacker
      module Int
        class Unsigned
          attr_reader :out

          def initialize(n_bits:)
            @n_bits = n_bits
            @out    = nil
          end

          def unpack!(bitstream:)
            bitstream.read_u_bit_int!(n_bits: @n_bits)

            @out = bitstream.out

            nil
          end
        end
      end
    end
  end
end
