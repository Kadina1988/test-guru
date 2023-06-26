# frozen_string_literal: true

class TestMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email
  end

  def send_message(message, user_email)
    @message = message
    @admin = Admin.take
    @user_email = user_email

    mail to: @admin.email
  end
end
