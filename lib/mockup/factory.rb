require File.expand_path('../load_generator/active_load_generator.rb', __FILE__)
require File.expand_path('../load_generator/passive_load_generator.rb', __FILE__)
require File.expand_path('../scenario/load_generator.rb', __FILE__)
require File.expand_path('../scenario/time_generator.rb', __FILE__)
require 'distribution'

module MockUp
  # Creates distribution generator from given input
  # @param [Hash] distribution distribution configuratiion
  # @return [Proc] distribution generator
  def self.distribution_factory(distribution = nil)
    case distribution["type"]
    when "Normal"
      Distribution::Normal.rng distribution["mean"], distribution["sigma"]
    when "F"
      -> { (Distribution::F.pdf distribution["df1"], distribution["df2"], distribution["f"])*rand*100 }
    when "Const"
      -> { distribution["value"] }
    when "LogPlayer"
      times = []
      File.open(distribution["file"]) do |f|
        times = f.readlines.map { |l| l.to_f }
      end
      -> { times.sample }
    else 
      raise ArgumentError, "Bad configuration"
    end
  end
  
  # Creates load generator from given configuration
  # @param [Hash] config generator configuratiion  
  # @return [Proc] load generator
  def self.factory(config)
    lg = case config["load_generator"]
          when "passive"
            MockUp::LoadGenerator::PassiveLoadGenerator
          else 
            MockUp::LoadGenerator::ActiveLoadGenerator
        end
    
    case config["scenario"]
    when "Load"
      MockUp::Scenario::LoadGenerator.new(&distribution_factory(config["distribution"]))
    when "Time"
      MockUp::Scenario::TimeGenerator.new(&distribution_factory(config["distribution"]))
    else
      raise ArgumentError, "Bad configuration"
    end.extend(lg)
  end
end