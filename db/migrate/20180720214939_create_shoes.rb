class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table(:shoes) do |t|
      t.column(:name, :string)      
    end
  end
end
