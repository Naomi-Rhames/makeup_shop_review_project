require 'rest-client'
module C_Makeup
    class Adapter
        BASE_URL = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"

        def fectch_makeup
            makeup = JSON.parse(RestClient.get(BASE_URL))
            makeup.each do |makeup|
                @makeup = Makeup.new(name: makeup["name"], price: makeup["price"], colors: makeup["colour_name"], image: makeup["image_link"], model: makeup["description"])
  
                @makeup.save 
            end
           
      end
    end
end

