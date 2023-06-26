# frozen_string_literal: true

require 'test_helper'

class FeedbackControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get feedback_create_url
    assert_response :success
  end

  test 'should get send' do
    get feedback_send_url
    assert_response :success
  end
end
