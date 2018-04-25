class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :home_name
      t.string :description
      t.string :place_type
      t.string :property_type

      t.string :country
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :address

      t.integer :price      
      t.integer :room_number
      t.integer :bed_number 
      t.integer :guest_number

      t.timestamps
    end
  end
end
