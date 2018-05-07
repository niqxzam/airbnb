json.extract! listing, :id, :home_name, :description, :price, :place_type, :property_type, :country, :city, :state, :address, :zipcode, :room_number, :guest_number, :bed_number, :created_at, :updated_at
json.url listing_url(listing, format: :json)
