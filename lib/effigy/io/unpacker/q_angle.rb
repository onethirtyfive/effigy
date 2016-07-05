module Effigy
  module IO
    module Unpacker
      module QAngle
        Vector = Struct.new(:a, :b, :c) do
          def to_s
            non_nil_members = members.reject(&:nil?)
            "<Vector #{non_nil_members.length}: #{non_nil_members.join(', ')}>"
          end
        end
      end
    end
  end
end

path = File.join(__dir__, 'q_angle', '*.rb')
Dir[path].each { |file| require file }
