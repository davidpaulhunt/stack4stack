json.array!(@technologies) do |technology|
  json.extract! technology, :id, :name
  json.url technology_url(technology, format: :json)
end
