class AddVerficationToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :verified, :boolean
  end
end
