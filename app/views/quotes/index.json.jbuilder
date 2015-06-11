json.array!(@quotes) do |quote|
  json.extract! quote, :id, :season, :episode, :character, :description
  json.url quote_url(quote, format: :json)
end
