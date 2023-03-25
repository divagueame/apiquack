# frozen_string_literal: true

require 'test_helper'

class PayloadTest < ActiveSupport::TestCase
  test 'Payload is valid if data is an empty object' do
    payload = Payload.new(data: '{}')
    payload.valid?
    assert_empty payload.errors[:payload]
  end

  test 'Payload is valid if data is a correct json object' do
    payload = Payload.new(data: '{"meow":20, "kitty": true}')
    payload.valid?
    assert_empty payload.errors[:payload]
  end

  test 'should not be created if data is not a valid json object' do
    payload = Payload.new(data: '{invalid JSON}')
    assert_equal false, payload.valid?
    assert_not_empty payload.errors[:data]
  end
end
