module Effigy
  module IO
    module Unpacker
      module Int
        class VarUnsigned
          attr_reader :out

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            bitstream.read_var_u_int!

            @out = bitstream.out

            nil
          end
        end
      end
    end
  end
end
