json.array!(@disputes) do |dispute|
  json.extract! dispute, :id, :name
  json.url dispute_url(dispute, format: :json)
end
