json.array!(@threats) do |threat|
  json.extract! threat, :id, :title, :category, :description
  json.url threat_url(threat, format: :json)
end
