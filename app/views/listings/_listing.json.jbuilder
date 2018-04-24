json.extract! listing, :id, :home_name, :description, :price, :tags, :created_at, :updated_at
json.url listing_url(listing, format: :json)
