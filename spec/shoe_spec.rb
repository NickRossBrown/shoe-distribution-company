require("spec_helper")

describe(Shoe) do

  describe('shoe.name') do
    it('will create a new brand with a name and price') do
      shoe = Shoe.create({:name => "Slipper"})
      expect([shoe.name]).to(eq(["Slipper"]))
    end
  end
end
