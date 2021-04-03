class Review < ActiveRecord::Base
    validates :rate, numericality: {only_integer: true}
    belongs_to :makeup
    belongs_to :user
end