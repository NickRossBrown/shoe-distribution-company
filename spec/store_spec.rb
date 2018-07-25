require("spec_helper")

describe(Store) do
  describe('store.name') do
    it('will create a new store with a name and price') do
      store = Store.create({:name => "Headquarters"})
      expect([store.name]).to(eq(["Headquarters"]))
    end
  end

  it("validates presence of the store name") do
    store= Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end


  it("ensures the length of name is at most 50 characters") do
    store= Store.new({:name => "a".*(101)})
    expect(store.save()).to(eq(false))
  end

 it('will check for any duplicate store names so that each branch name is unqiue') do
   Store.delete_all
   store = Store.create({:name => "epicodus"})
   store1 = Store.create({:name => "epicodus"})
   expect(Store.all).to(eq([store]))
 end

 it('will capitalize the first letter of store name') do
  store = Store.create({:name => "nike"})
  expect(Store.all.last.name).to(eq("Nike"))
 end

end
