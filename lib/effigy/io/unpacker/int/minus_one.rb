module Effigy
  module IO
    module Unpacker
      module Int
        class MinusOne
          attr_reader :out

          def initialize
            @out = out
          end

          def unpack!(bitstream:)
            bitstream.read_var_u_int!

            @out = bitstream.out - 1

            nil
          end
        end
      end
    end
  end
end
