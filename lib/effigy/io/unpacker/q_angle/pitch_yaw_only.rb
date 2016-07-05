module Effigy
  module IO
    module Unpacker
      module QAngle
        class PitchYawOnly
          def initialize(n_bits:)
            @n_bits = n_bits
            @out    = nil
          end

          def unpack!(bitstream:)
            a, b = nil, nil

            if (n_bits | 0x20) == 0x20
              bitstream.read_u_bit_int!(n_bits: 32)
              a = Float.no_scale(uint32: bitstream.out)
              bitstream.read_u_bit_int!(n_bits: 32)
              b = Float.no_scale(uint32: bitstream.out)
            else
              bitstream.read_bit_angle(n_bits: @n_bits)
              a = Float.no_scale(uint32: bitstream.out)
              bitstream.read_bit_angle(n_bits: @n_bits)
              b = Float.no_scale(uint32: bitstream.out)
            end

            @out = Vector.new(a, b)

            nil
          end
        end
      end
    end
  end
end
