class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :home_name
      t.string :description
      t.integer :price
      t.string :tags

      t.timestamps
    end
  end
end
