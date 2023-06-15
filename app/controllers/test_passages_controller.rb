class TestPassagesController < ApplicationController
  before_action :set_test_passege, only: %i[show result update send_message message]

  def show;end

  def result
    puts 'backander' if current_user.backender?
    puts 'all levele test' if current_user.all_level_tests?(@test_passage.test.level)
    puts 'first time' if current_user.passed_first_time?
    puts '100 persent' if current_user.one_hundred_percent?
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to test_passage_path
    end
  end

  private

  def set_test_passege
    @test_passage = TestPassage.find(params[:id])
  end
end
