class BadgeService
  attr_accessor :test_passage, :user, :test, :success_tests

  def initialize(test_passage)
    @test_passage  = test_passage
    @user          = test_passage.user
    @test          = test_passage.test
    @success_tests = []
  end

  def find_success_tests
    @user.test_passages.each do |test_passage|
      @success_tests << test_passage.test if test_passage.success?
    end
  end
end
