module Effigy
  module IO
    module Unpacker
      class Bool
        attr_reader :out

        def initialize
          @out = nil
        end

        def unpack!(bitstream:)
          bitstream.read_bit_flag!

          @out = bitstream.out

          nil
        end
      end
    end
  end
end
