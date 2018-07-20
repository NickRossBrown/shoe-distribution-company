require("spec_helper")


describe(Brand) do
  describe('brand.name and brand.price') do
    it('will create a new brand with a name and price') do
      brand = Brand.create({:name => "Slippers", :price => 35})
      expect(Brand.all).to(eq([brand]))
    end
  end
end
