class Endpoint < ApplicationRecord
    has_many :endpoint_payloads
    has_many :payloads, through: :endpoint_payloads
end
