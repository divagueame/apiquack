json.extract! payload, :id, :data, :created_at, :updated_at
json.url payload_url(payload, format: :json)
