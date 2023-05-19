require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get messages_form_url
    assert_response :success
  end

  test "should get send" do
    get messages_send_url
    assert_response :success
  end
end
