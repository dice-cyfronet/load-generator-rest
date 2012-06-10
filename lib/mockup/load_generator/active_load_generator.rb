module MockUp
  module LoadGenerator
    module ActiveLoadGenerator
    protected      
      # Performs some math
      # @param [Numeric] t_max time limit of computation
      def compute(t_max = nil)
        t_0 = Time.now
        x = 4234567
        y = 0
        (x-1).downto 2 do |i|
          y += x%i
          break if (t_max and (Time.now-t_0) > t_max)
        end
        Time.now - t_0
      end
    end
  end
end
