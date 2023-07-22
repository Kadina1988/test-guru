class BadgeService
  attr_accessor :test_passage, :user, :test, :success_tests, :backand_tests

  def initialize(test_passage)
    @test_passage  = test_passage
    @user          = test_passage.user
    @test          = test_passage.test
    @success_tests = []
  end

  # def check_achievement
  #   @user.badges << Badge.all.each do |badge|
  #                     badge.rule: ''
  # end

  def backand?
    @backand_tests.uniq.count == Test.where(category_id: 1).count
  end

  def find_backand_tests
    @backand_tests = []
    @user.test_passages.each do |tp|
      @backand_tests << tp.test if tp.success? && tp.test.category_id == 1
    end
  end




end
