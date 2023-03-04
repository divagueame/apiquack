class Endpoint < ApplicationRecord
    belongs_to :expected_payload, class_name: 'Payload', optional: true
    belongs_to :wrong_payload, class_name: 'Payload', optional: true  
end
