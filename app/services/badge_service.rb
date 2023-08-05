class BadgeService

  attr_accessor :success_tests, :passed_tests_of_category_ids, :category_tests_ids, :user

  def initialize(test_passage)
    @test_passage  = test_passage
    @user          = test_passage.user
    @test          = test_passage.test
  end

  def call
    Badge.find_each { |badge| send(badge.rule) }
  end

  def success_tests
    @user.test_passages.where(success: true)
  end

  def category_complete
    @category_tests_ids = Test.same_category(@test.category.title).pluck(:id)

    @passed_tests_of_category_ids = success_tests.includes(:test)
                                                 .where(test: category_tests_ids)
                                                 .pluck(:test_id)

  #  if @category_tests_ids & @passed_tests_of_category_ids == @category_tests_ids
  #     @user.badges << Badge.find_by(rule: 'category_complete')
  #   end

  end

  def level_complete
    puts 'level complete'
    # passed_tests_ids = TestPassage
    #                    .level_complete(@user, @test.level)
    #                    .where(success: true)
    #                    .pluck(:id)
    #                    .uniq

    # level_tests_ids = Test.where(level: 1)
    #                   .pluck(:test_id)

    # passed_tests_ids & level_tests_ids == level_tests_ids
  end

  def first_try
    @user.passed_test_ids
         .count(@user.passed_tests.last.id) == 1 && @test_passage.success?
  end
end
