json.array!(@films) do |film|
  json.extract! film, :id, :name, :description, :picture
  json.url film_url(film, format: :json)
end
