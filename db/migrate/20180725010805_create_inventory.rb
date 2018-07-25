class CreateInventory < ActiveRecord::Migration[5.2]
  def change
    create_table(:inventories) do |t|
    t.column(:store_id, :int)
    t.column(:brand_id, :int)
    end
  end
end
