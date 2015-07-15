json.array!(@controllers) do |controller|
  json.extract! controller, :id, :meetupsearches
  json.url controller_url(controller, format: :json)
end
