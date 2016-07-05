module Effigy
  module IO
    module Unpacker
      module Flaot
        class CellCoord
          attr_reader :out

          def initialize(n_bits:, is_integral:, is_low_precision:)
            @n_bits           = n_bits
            @is_integral      = !!is_integral
            @is_low_precision = !!is_low_precision
            @out              = nil
          end

          def unpack!(bitstream:)
            bitstream.read_cell_coord!(
              n_bits: @n_bits,
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
