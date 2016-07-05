module Effigy
  module IO
    module Unpacker
      module Float
        class Coord
          attr_reader :out

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            bitstream.read_bit_coord!

            @out = bitstream.out

            nil
          end
        end
      end
    end
  end
end
