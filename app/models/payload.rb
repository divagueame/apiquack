class Payload < ApplicationRecord
    has_many :expected_endpoints, class_name: 'Endpoint', foreign_key: 'expected_payload_id'
    has_many :wrong_endpoints, class_name: 'Endpoint', foreign_key: 'wrong_payload_id'  
end
