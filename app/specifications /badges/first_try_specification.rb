module Badges
  class FirstTrySpecification < AbstractRulesSpecification

    def satisfies?
      @user.passed_test_ids.count(@user.passed_tests.last.id) == 1 && @test_passage.success?
    end
  end
end
