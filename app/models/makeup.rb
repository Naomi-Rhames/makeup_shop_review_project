class Makeup < ActiveRecord::Base
     has_many :reviews  
    
   def self.search(search)
    where('name like :pat or content like :pat', :pat => "%#{search}%")
    end
end