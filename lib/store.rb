class Store < ActiveRecord::Base
    has_many :inventorys
    has_many :brands, through: :inventorys
    validates(:name, {:presence => true, :length => {:maximum => 100}, :uniqueness => true})
    before_validation :capitalize_first_letter


    def capitalize_first_letter
      self.name= name.capitalize
    end
end
