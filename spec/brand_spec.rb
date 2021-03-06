require("spec_helper")

describe(Brand) do
  describe('brand.name and brand.price') do
    it('will create a new brand with a name and price') do
      brand = Brand.create({:name => "Huggs", :price => 35})
      expect([brand.name,brand.price]).to(eq(["Huggs",35]))
    end
  end

  it("validates presence of the brand name") do
    brand= Brand.new({:name => ""})
    expect(brand.save()).to(eq(false))
  end


  it("ensures the length of name is at most 50 characters") do
    brand= Brand.new({:name => "a".*(101)})
    expect(brand.save()).to(eq(false))
  end

 it('will check for any duplicate brand names so that each branch name is unqiue') do
   Brand.delete_all
   brand = Brand.create({:name => "epicodus", :price => 21})
   brand1 = Brand.create({:name => "epicodus"})
   expect(Brand.all).to(eq([brand]))
 end

 it('will capitalize the first letter of brand name') do
  brand = Brand.create({:name => "nike"})
  expect(Brand.all.last.name).to(eq("Nike"))
 end


end
