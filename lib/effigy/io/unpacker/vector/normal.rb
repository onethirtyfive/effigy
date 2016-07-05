module Effigy
  module IO
    module Unpacker
      module Vector
        class Normal
          attr_reader :out

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            bitstream.read_3_bit_normal
            
            @out = Vector.new(bitstream.out)

            nil
          end
        end
      end
    end
  end
end
