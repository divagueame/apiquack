class EndpointPayload < ApplicationRecord
    belongs_to :endpoint
    belongs_to :payload
end