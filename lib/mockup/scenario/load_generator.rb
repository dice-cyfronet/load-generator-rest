module MockUp
  module Scenario
    class LoadGenerator
      def initialize (&block)
        @block = block
      end
    
      def generate
        t_0 = Time.now
        @block.call.to_i.times do 
          compute
        end
        Time.now - t_0
      end  
    end
  end
end