require 'faker'

# Create some endpoints
5.times do
  Endpoint.create!(
    name: Faker::Lorem.word,
    url: Faker::Internet.url,
    description: Faker::Lorem.sentence,
    method: Endpoint.methods.keys.sample
  )
end

# Create some payloads
10.times do
  Payload.create!(data: { message: Faker::Lorem.sentence }.to_json)
end

# Assign some payloads to endpoints
Endpoint.all.each do |endpoint|
  3.times do
    EndpointPayload.create!(
      endpoint: endpoint,
      payload: Payload.order("RANDOM()").first,
      expect_success: Faker::Boolean.boolean
    )
  end
end
