class Makeup < ActiveRecord::Base
    has_many :reviews  
    
    # def self.search(search)
    #     if search
    #         makeup = Makeup.find_by(name: search)
    #         if makeup
    #             self.where(makeup_id: makeup)
    #         else
    #             Makeuo.all
    #         end
    #     else 
    #         Makeup.all
    #     end
    # end
end