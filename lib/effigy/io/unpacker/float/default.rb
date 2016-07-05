module Effigy
  module IO
    module Unpacker
      module Float
        class Default
          attr_reader :out

          def initialize(bit_count:, min_value:, max_value:)
            @bit_count  = bit_count
            @min_value  = min_value
            @max_value  = max_value
            @multiplier = 1.0 / ((1 << @bit_count) - 1)
            @out        = nil
          end

          def unpack!(bitstream:)
            bitstream.read_u_bit_int!(bit_count: @bit_count)

            @out = @min_value + (@max_value - @min_value) * bitstream.out

            nil
          end
        end
      end
    end
  end
end
