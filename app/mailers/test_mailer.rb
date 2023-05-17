class TestMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email
  end

  def send_message(test_passage, message)
    @message = message
    @my_email = test_passage.user.email
    @admin = Admin.take

    mail to: @admin.email
  end
end
