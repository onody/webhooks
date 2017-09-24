require 'test_helper'

class Ifttt::Locations::KitakuControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post ifttt_locations_kitaku_create_url
    assert_response :success
  end
end
