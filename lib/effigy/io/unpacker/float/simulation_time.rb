module Effigy
  module IO
    module Unpacker
      module Float
        class SimulationTime
          attr_reader :out

          FRAME_TIME = 1.0 / 30

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            bitstream.read_var_u_long!

            @out = bitstream.out * FRAME_TIME

            nil
          end
        end
      end
    end
  end
end
