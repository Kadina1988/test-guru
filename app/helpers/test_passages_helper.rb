module TestPassagesHelper

  def remaining_time
    @test_passage.set_end_time - Time.current
  end
end
