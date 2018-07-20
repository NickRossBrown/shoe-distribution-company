class Store < ActiveRecord::Base
    has_many :brands
    has_many :shoes
end
