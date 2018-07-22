class Store < ActiveRecord::Base
    has_many :inventorys
    has_many :brands, through: :inventorys
end
