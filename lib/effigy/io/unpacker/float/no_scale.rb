module Effigy
  module IO
    module Unpacker
      module Float
        class NoScale
          attr_reader :out

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            bitstream.read_u_bit_int!

            @out = Float.no_scale(uint32: bitstream.out)

            nil
          end
        end
      end
    end
  end
end
