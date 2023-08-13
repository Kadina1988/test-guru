module Badges
  class CategoryCompleteSpecification < AbstractRulesSpecification

    def satisfies?
      return unless @test.category_id == Category.find_by(title: @value).id

      category_tests_ids = Test.same_category(@value).pluck(:id)

      passed_tests = success_tests(category_tests_ids).where(checked_category: false)

      if category_tests_ids & passed_tests.pluck(:test_id) == category_tests_ids
        passed_tests.each { |i| i.update_columns(checked_category: true) }
        true
      else
        false
      end
    end
  end
end
