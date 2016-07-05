module Effigy
  module IO
    module Unpacker
      module Float
        class Normal
          attr_reader :out

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            bitstream.read_bit_normal!

            @out = bitstream.out

            nil
          end
        end
      end
    end
  end
end
