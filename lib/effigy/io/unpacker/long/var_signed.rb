module Effigy
  module IO
    module Unpacker
      module Long
        class VarSigned
          attr_reader :out

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            bitstream.read_var_s_long!

            @out = bitstream.out

            nil
          end
        end
      end
    end
  end
end
