# Preview all emails at http://localhost:3000/rails/mailers/test_mailer
class TestMailerPreview < ActionMailer::Preview
    # Preview this email at http://localhost:3000/rails/mailers/test_mailer/completed_test
    def completed_test
      test_passage = TestPassage.new(user: User.first, test: Test.first)

      TestsMailer.completed_test(test_passage)
    end
end
