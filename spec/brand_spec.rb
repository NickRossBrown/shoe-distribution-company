require("spec_helper")


describe(Brand) do
  describe('brand.name and brand.price') do
    it('will create a new brand with a name and price') do
      brand = Brand.create({:name => "Huggs", :price => 35})
      expect([brand.name,brand.price]).to(eq(["Slippers",35]))
    end
  end
end
