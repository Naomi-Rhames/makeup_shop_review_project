require 'rest-client'
module C_Makeup
    class Adapter
        BASE_URL = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"

        def fectch_makeup
            makeup = JSON.parse(RestClient.get(BASE_URL))
            makeup.each do |makeup|
                @makeup = Makeup.new(name: makeup["name"], price: makeup["price"], image: makeup["image_link"])
  
                @makeup.save 
            end
           
      end
    end
end

