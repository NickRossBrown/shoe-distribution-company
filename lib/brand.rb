class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:shoes)
  has_many :inventorys
  has_many :stores, through: :inventorys
  validates(:name, {:presence => true, :length => {:maximum => 100}, :uniqueness => true})
  before_validation :capitalize_first_letter



  def capitalize_first_letter
    self.name= name.capitalize
  end

end
