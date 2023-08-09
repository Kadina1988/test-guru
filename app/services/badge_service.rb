class BadgeService

  def initialize(test_passage)
    @test_passage  = test_passage
    @user          = test_passage.user
    @test          = test_passage.test
  end

  def call
    Badge.find_each do |badge|
      send(badge.rule, badge.value)
    end
  end

  private

  def success_tests
    @user.test_passages.where(success: true)
  end

  def category_complete(category)
    return unless @test.category.title == category
    category_tests_ids = Test.same_category(category).pluck(:id)

    passed_tests = success_tests.includes(:test)
                                .where(test: category_tests_ids)
                                .where(checked_category: false)

    if category_tests_ids & passed_tests.pluck(:test_id) == category_tests_ids
      @user.badges << Badge.find_by(rule: 'category_complete', value: category)
      passed_tests.each { |i| i.update_columns(checked_category: true) }
    end
  end

  def level_complete(level)
    return unless @test.level == level.to_i
    level_tests_ids = Test.where(level: level).pluck(:id)

    passed_tests = success_tests.includes(:test)
                                .where(test: level_tests_ids)
                                .where(checked_level: false)

    if level_tests_ids & passed_tests.pluck(:test_id) == level_tests_ids
      @user.badges << Badge.find_by(rule: 'level_complete', value: level)
      passed_tests.each { |i| i.update_columns(checked_level: true) }
    end
  end

  def first_try(value = '')
    if @user.passed_test_ids.count(@user.passed_tests.last.id) == 1 && @test_passage.success?
      @user.badges << Badge.find_by(rule: 'first_try')
    end
  end
end
