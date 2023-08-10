class BadgeService
  def initialize(test_passage)
    @test_passage  = test_passage
    @user          = test_passage.user
    @test          = test_passage.test
  end

  def call
    Badge.find_each do |badge|
      @user.badges << badge if send(badge.rule, badge.value)
    end
  end

  private

  def success_tests(test_ids)
    @user.test_passages
         .where(success: true)
         .includes(:test)
         .where(test: test_ids)
  end

  def category_complete(category)
    return unless @test.category_id == Category.find_by(title: category).id

    category_tests_ids = Test.same_category(category).pluck(:id)

    passed_tests = success_tests(category_tests_ids).where(checked_category: false)

    if category_tests_ids & passed_tests.pluck(:test_id) == category_tests_ids
      passed_tests.each { |i| i.update_columns(checked_category: true) }
    end
  end

  def level_complete(level)
    return unless @test.level == level.to_i

    level_tests_ids = Test.where(level:).pluck(:id)

    passed_tests = success_tests(level_tests_ids).where(checked_level: false)

    if level_tests_ids & passed_tests.pluck(:test_id) == level_tests_ids
      passed_tests.each { |i| i.update_columns(checked_level: true) }
    end
  end

  def first_try(_value)
    @user.passed_test_ids.count(@user.passed_tests.last.id) == 1 && @test_passage.success?
  end
end
