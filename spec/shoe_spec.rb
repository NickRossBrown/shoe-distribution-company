require("spec_helper")

describe(Shoe) do

  describe('shoe.name') do
    it('will create a new brand with a name and price') do
      binding.pry
      shoe = Shoe.create({:name => "Slippers"})
      expect(Shoe.all).to(eq([shoe]))
    end
  end
end
