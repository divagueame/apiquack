# frozen_string_literal: true

class Endpoint < ApplicationRecord
  has_many :endpoint_payloads
  has_many :payloads, through: :endpoint_payloads
  scope :by_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
  accepts_nested_attributes_for :payloads #, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
  
  def self.search(params)
    endpoints = Endpoint.all
    endpoints = endpoints.by_name(params[:query]) if params[:query].present?
    endpoints
  end
end
