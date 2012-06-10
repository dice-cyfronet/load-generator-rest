module MockUp
  module LoadGenerator
    module PassiveLoadGenerator
    protected
      # Generates passive (mock) load by sleeping for some time
      # @param [Numeric] t_max time to sleep
      def compute(t_max = 1.0)
        t_0 = Time.now
        Kernel.sleep(t_max)
        Time.now - t_0
      end
    end
  end
end
