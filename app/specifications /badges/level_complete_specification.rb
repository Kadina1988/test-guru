module Badges
  class LevelCompleteSpecification < AbstractRulesSpecification

    def satisfies?
      return unless @test.level == @value.to_i

      level_tests_ids = Test.where(level: @value).pluck(:id)

      passed_tests = success_tests(level_tests_ids).where(checked_level: false)

      if level_tests_ids & passed_tests.pluck(:test_id) == level_tests_ids
        passed_tests.each { |i| i.update_columns(checked_level: true) }
        true
      else
        false
      end
    end
  end
end
