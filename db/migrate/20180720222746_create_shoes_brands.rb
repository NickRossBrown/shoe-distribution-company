class CreateShoesBrands < ActiveRecord::Migration[5.2]
  def change
    create_table(:brands_shoes) do |t|
    t.column(:shoe_id, :int)
    t.column(:brand_id, :int)
    t.column(:brand_price, :int)
    end
  end
end
