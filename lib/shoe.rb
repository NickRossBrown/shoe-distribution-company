class Shoe < ActiveRecord::Base
    has_andblongs_to_many :brands

end
