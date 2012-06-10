module MockUp
  module Scenario
    class TimeGenerator
      def initialize (&block)
          @block = block
      end
      def generate
        t_0 = Time.now        
        t = @block.call.to_f
        while t > 0 do
          t -= compute t
        end
        Time.now - t_0
      end
    end
  end
end