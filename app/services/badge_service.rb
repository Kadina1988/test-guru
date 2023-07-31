class BadgeService

  def initialize(test_passage)
    @test_passage  = test_passage
    @user          = test_passage.user
    @test          = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      if send("#{badge.rule}")
        # @user.badges << badge
        puts badge
      end
    end
  end

  def category_complete?(category)
    backand_pass_tests = TestPassage
                         .category_complete(@user, category)
                         .where(success: true)
                         .pluck(:test_id)
                         .uniq
                         .count

    backand_tests = Test.where(category_id: 1).count
    backand_pass_tests == backand_tests
  end

  def level_complete?(level)
    easy_pass_tests = TestPassage
                      .level_complete(@user, level)
                      .where(success: true)
                      .pluck(:test_id)
                      .uniq
                      .count

    easy_tests = Test.where(level: 1).count
    easy_pass_tests == easy_tests
  end

  def first_try?
    @user.passed_test_ids
         .count(@user.passed_tests.last.id) == 1 && @test_passage.success?
  end
end
