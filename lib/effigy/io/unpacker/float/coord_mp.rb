module Effigy
  module IO
    module Unpacker
      module Float
        class CoordMP
          attr_reader :out

          def initialize(is_integral:, is_low_precision:)
            @is_integral      = !!is_integral
            @is_low_precision = !!is_low_precision
            @out              = nil
          end

          def unpack!(bitstream:)
            bitstream.read_coord_mp!(
              is_integral: @is_integral,
              is_low_precision: @is_low_precision
            )

            @out = bitstream.out

            nil
          end
        end
      end
    end
  end
end
