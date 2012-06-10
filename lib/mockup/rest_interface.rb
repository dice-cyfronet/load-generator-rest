require "sinatra/base" 
require "sinatra/sugar"               
require 'json'    
module MockUp
  class RESTInterface < Sinatra::Base
    get '/*' do                            
      content_type :text
      settings.load_generator.generate.to_s
    end

    post '/*' do                            
      content_type :text
      settings.load_generator.generate.to_s
    end
  end
end