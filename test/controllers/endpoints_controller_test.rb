require "test_helper"

class EndpointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # @endpoint = Endpoint.all.first
  end

  test "should get index" do
    get endpoints_url
    assert_response :success
  end

  test "should get new" do
    get new_endpoint_url
    assert_response :success
  end

  test "should create endpoint" do
    assert_difference("Endpoint.count") do
      post endpoints_url, params: { endpoint: { description: "Description for this endpoint", name: "New endpoint name", url: '/' } }
    end

    assert_redirected_to endpoint_url(Endpoint.last)
  end

  # test "should show endpoint" do
  #   get endpoint_url(@endpoint)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_endpoint_url(@endpoint)
  #   assert_response :success
  # end

  # test "should update endpoint" do
  #   patch endpoint_url(@endpoint), params: { endpoint: { description: @endpoint.description, name: @endpoint.name, url: @endpoint.url } }
  #   assert_redirected_to endpoint_url(@endpoint)
  # end

  # test "should destroy endpoint" do
  #   assert_difference("Endpoint.count", -1) do
  #     delete endpoint_url(@endpoint)
  #   end

  #   assert_redirected_to endpoints_url
  # end
end
