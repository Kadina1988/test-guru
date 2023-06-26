# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/test_mailer
class TestMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/test_mailer/completed_test
  def completed_test
    test_passage = TestPassage.new(user: User.first, test: Test.first)

    TestsMailer.completed_test(test_passage)
  end

  def send_message
    message = 'Hello'
    admin = Admin.first
    user_email = 'shef@mail.ru'

    TestMailer.send_message(message, user_email)
  end
end
