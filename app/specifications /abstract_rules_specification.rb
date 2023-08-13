class AbstractRulesSpecification
  def initialize(test_passage, value = nil)
    @value = value
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def satisfies?
    raise "method \'#{__method__}\' undefined for #{self.class}"
  end

  protected

  def success_tests(test_ids)
    @user.test_passages
         .where(success: true)
         .includes(:test)
         .where(test: test_ids)
  end
end
