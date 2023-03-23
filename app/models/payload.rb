# frozen_string_literal: true

class Payload < ApplicationRecord
  has_many :endpoint_payloads
  has_many :endpoints, through: :endpoint_payloads
  validate :validate_json

  private

  def validate_json
    begin
      JSON.parse(data)
    rescue JSON::ParserError => e
      errors.add(:data, "Ooops... Not a valid json object: #{e.message}")
    end
  end
end
