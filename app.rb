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

  erb(:stores)
end

get ("/brands") do

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
