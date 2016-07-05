module Effigy
  module IO
    module Unpacker
      module String
        class Len
          attr_reader :out

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            bitstream.read_u_bit_int(9)
            bitstream.read_string(bitstream.out)

            @out = bitstream.out

            nil
          end
        end
      end
    end
  end
end
