# frozen_string_literal: true

def array_to_enum_hash(a)
  a.index_with(&:to_s).symbolize_keys
end

class Endpoint < ApplicationRecord
  include EnumMethods
  validates :name, presence: true
  validates :url, presence: true

  enum method: array_to_enum_hash(EndpointMethod::METHODS), _suffix: true
  has_many :endpoint_payloads, dependent: :destroy
  has_many :payloads, through: :endpoint_payloads
  scope :by_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
  accepts_nested_attributes_for :payloads # , reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true

  def self.search(params)
    endpoints = Endpoint.all
    endpoints = endpoints.by_name(params[:query]) if params[:query].present?
    endpoints
  end

  def method
    @method ||= EndpointMethod.new(read_attribute(:method))
  end
end
