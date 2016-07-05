module Effigy
  module IO
    module Unpacker
      module Vector
        class Default
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
            @unpacker.unpack!(bitstream: bitstream)
            c = unpacker.out

            @out = Vector.new(a, b, c)

            nil
          end
        end
      end
    end
  end
end
