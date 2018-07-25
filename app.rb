require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get ("/") do
  erb(:index)
end

post ("/") do
  erb(:index)
end

get ("/brands") do
  @brands=Brand.all
  @shoes=Shoe.all
  erb(:brands)
end

patch ("/brands") do
  brand1_id = params.fetch("brands_update").to_i
  brand1 = Brand.find(brand1_id)
  shoe1_id = params.fetch("shoes_update").to_i

  # brand1.update({:shoe_ids => [shoe1_id]})
  brand1.shoes.push(Shoe.find(shoe1_id))
  @brands=Brand.all
  @shoes=Shoe.all
  erb(:brands)
end

get ("/brands/delete") do
  brand_id = params.fetch("brands_delete").to_i
  brand = Brand.find(brand_id)
  brand.delete
  @brands=Brand.all
  @shoes=Shoe.all
  erb(:brands)
end

get ("/brands/update") do
  brand_id = params.fetch("brand_update").to_i
  brand = Brand.find(brand_id)
  brand_price=brand.price
  brand_name = brand.name
  if (params.fetch("rename_brand") != "")
    brand_name = params.fetch("rename_brand")
  end
  if (params.fetch("reprice_brand") != "")
    brand_price = params.fetch("reprice_brand")
    brand_price= brand_price.to_f*100
  end

  brand.update(:name => brand_name, :price => brand_price)
  @brands=Brand.all
  @shoes=Shoe.all
  erb(:brands)
end



get ("/brands/:id") do
  brand_id = params.fetch("id").to_i
  @brands=Brand.find(brand_id)
  @shoes=Shoe.all
  erb(:brands)
end

post("/brands") do
  binding.pry
  new_brand = params.fetch("brandName")
  brand_price = params.fetch("brandPrice")
  Brand.create({:name => new_brand, :price => brand_price})
  @brands=Brand.all
  @shoes=Shoe.all
  erb(:brands)
end

get ("/shoes") do
  @shoes=Shoe.all
  erb(:shoes)
end

post("/shoes") do
  new_shoe = params.fetch("shoeName")
  Shoe.create({:name => new_shoe})
  @shoes=Shoe.all
  erb(:shoes)
end


get ("/stores") do
  @stores=Store.all
  @brands=Brand.all
  erb(:stores)
end

post("/stores") do
  new_store = params.fetch("storeName")
  Store.create({:name => new_store })
  @stores=Store.all
  @brands=Brand.all
  erb(:stores)
end

get ("/stores/:id") do

  store_id = params.fetch("id")
  @store=Store.find(store_id)
  binding.pry
  @brands=Brand.find(store_id)
  @stores=Store.all
  @shoes=Shoe.all
  erb(:store)
end


get ("/stores/delete") do
  store_id = params.fetch("store_delete").to_i
  store = Store.find(store_id)
  store.delete
  @stores=Store.all
  @brands=Brand.all
  redirect(:stores)
end

get ("/stores/update") do
  store_id = params.fetch("store_update").to_i
  store = Store.find(store_id)
  store_name = store.name
  if (params.fetch("rename_store") != "")
    store_name = params.fetch("rename_store")
  end
  store.update(:name => store_name)
  @stores=Store.all
  @brands=Brand.all
  redirect(:stores)
end

patch ("/stores/assign-brand") do
  brand1_id = params.fetch("brands_assign_id").to_i
  brand1 = Brand.find(brand1_id)
  store1_id = params.fetch("store_id").to_i
  store1 = Store.find(store1_id)

  # brand.update({:store_ids => [store1_id]})
  brand1.stores.push(store1)
  @stores=Store.all
  @brands=Brand.all
  @shoes=Shoe.all
  @inventories=Inventory.all
  redirect(:stores)
end
