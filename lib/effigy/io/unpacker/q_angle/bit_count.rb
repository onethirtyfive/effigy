module Effigy
  module IO
    module Unpacker
      module QAngle
        class BitCount
          attr_reader :out

          def initialize(n_bits:)
            @n_bits = n_bits
            @out    = nil
          end

          def unpack!(bitstream:)
            vector = Vector.new

            [:a, :b, :c].each do |member|
              bitstream.read_bit_angle!
              vector.send("#{member}=".to_sym, member, bitstream.out)
            end

            @out = vector

            nil
          end
        end
      end
    end
  end
end
