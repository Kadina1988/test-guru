class BadgeService
  RULES = { category_complete: Badges::CategoryCompleteSpecification,
            level_complete: Badges::LevelCompleteSpecification,
            first_try: Badges::FirstTrySpecification }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule.to_sym].new(@test_passage, badge.value)
      add_badge(badge) if rule.satisfies?
    end
  end

  private

  def add_badge(badge)
    @test_passage.user.badges << badge
  end
end
