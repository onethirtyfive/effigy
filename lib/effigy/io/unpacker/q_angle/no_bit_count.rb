module Effigy
  module IO
    module Unpacker
      module QAngle
        class NoBitCount
          attr_reader :out

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            vector = Vector.new

            has_a, has_b, has_c =
              3.times.map do
                bitstream.read_bit_flag!
                bitstream.out
              end

            if has_a
              bitstream.read_bit_coord!
              vector.a = bitstream.out
            end

            if has_b
              bitstream.read_bit_coord!
              vector.b = bitstream.out
            end

            if has_c
              bitstream.read_bit_coord!
              vector.c = bitstream.out
            end

            @out = vector

            nil
          end
        end
      end
    end
  end
end
