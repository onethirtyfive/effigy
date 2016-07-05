module Effigy
  module IO
    module Unpacker
      module String
        class C
          attr_reader :out

          def initialize
            @out = nil
          end

          def unpack!(bitstream:)
            bitstream.read_c_string

            @out = bitstream.out

            nil
          end
        end
      end
    end
  end
end
