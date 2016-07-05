module Effigy
  module IO
    module Float
      module_function

      def no_scale(uint32:)
        packed = [uint32].pack('N').bytes.map do |byte|
          byte.ord
        end # V?

        raise 'not 32 bits' unless packed.length == 4

        packed.unpack('D')
      end
    end
  end
end

path = File.join(__dir__, 'float', '*.rb')
Dir[path].each { |file| require file }
