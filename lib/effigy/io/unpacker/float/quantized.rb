module Effigy
  module IO
    module Unpacker
      module Float
        class Quantized
          attr_reader :out

          ROUND_DOWN             = 0b0001
          ROUND_UP               = 0b0010
          ENCODE_ZERO_EXACTLY    = 0b0100
          ENCODE_INTEGER_EXACTLY = 0b1000
          MULTIPLIERS            = [0.9999, 0.99, 0.9, 0.8, 0.7].freeze

          def self.compute_encode_flags(flags:, min_value:, max_value:)

          end

          def self.construct_multipliers(initial:)
            MULTIPLIERS.dup.unshift(initial)
          end

          def self.compute_range_multiplier(n_bits:, range:)
            high_value =
              if n_bits == 32
                0xFFFFFFFE
              else
                # masks read
              end

            range_multiplier =
              if range.abs <= 0.001
                high_value.to_f
              else
                high_value / range.to_f
              end

            construct_multipliers(initial: range_multiplier).each do |m|
              range_multiplier = (high_value / range.to_f) * m

              is_bad_representation =
                (range_multiplier * range).to_i > high_value ||
                range_multiplier * range > high_value.to_f

              return range_multiplier unless is_bad_representation
            end

            raise 'unable to represent range'
          end

          def self.compute_decode_multiplier(quanta:)

          end

          def initialize(field_name:, bit_count:, flags:,
                         min_value:, max_value:)
            @field_name          = field_name
            @bit_count           = bit_count
            @flags               = flags
            @min_value           = min_value
            @max_value           = max_value
            @range_multiplier    = nil # FIXME
            @decode_multiplier   = nil # FIXME
            @out                 = nil
          end

          def unpack!(bitstream:)
            nil
          end
        end
      end
    end
  end
end
