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

get ("/stores") do
  @stores = []
  erb(:stores)
end

get ("/brands") do
  @brands=Brand.all
  @shoes=Shoe.all
  erb(:brands)
end
patch ("/brands") do
  binding.pry
  @brands=Brand.all
  @shoes=Shoe.all
  erb(:brands)
end
get ("/brands/:id") do
  @brands=Brand.all
  @shoes=Shoe.all
  erb(:brands)
end

post("/brands") do
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
