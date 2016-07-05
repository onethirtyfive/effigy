module Effigy
  module IO
    module Unpacker
      module Int
        class VarSigned
          attr_reader :out

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            bitstream.read_var_s_int!

            @out = bitstream.out

            nil
          end
        end
      end
    end
  end
end
