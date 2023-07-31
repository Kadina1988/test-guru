class DemBadgeService
  def initialize(test_passage)
    @test_passage  = test_passage
    @user          = test_passage.user
    @test          = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      if send("#{badge.rule}?")
        @user.badges << badge
      end
    end
  end

def again_complete?

end

  def backend_category_complete?
    backand_pass_tests = TestPassage
                         .category_backend(@user)
                         .where(success: true)
                         .pluck(:test_id)
                         .uniq
                         .count

    backand_tests = Test.where(category_id: 1).count
    backand_pass_tests == backand_tests
  end

  def easy_level_complete?
    easy_pass_tests = TestPassage
                      .level_easy(@user)
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

  def hundred_persent?
    @test_passage.test_result == 100
  end

end


