json.extract! artist, :id, :artist_name, :phone, :created_at, :updated_at
json.url artist_url(artist, format: :json)
