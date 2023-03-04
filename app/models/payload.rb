class Payload < ApplicationRecord
    has_many :endpoint_payloads
    has_many :endpoints, through: :endpoint_payloads
end
