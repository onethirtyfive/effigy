module Effigy
  module IO
    module Unpacker
      module Vector
        class XY
          attr_reader :out

          def initialize(unpacker:)
            @unpacker = unpacker
            @out      = nil
          end

          def unpack!(bitstream:)
            @unpacker.unpack!(bitstream: bitstream)
            a = unpacker.out
            @unpacker.unpack!(bitstream: bitstream)
            b = unpacker.out

            @out = Vector.new(a, b)

            nil
          end
        end
      end
    end
  end
end
