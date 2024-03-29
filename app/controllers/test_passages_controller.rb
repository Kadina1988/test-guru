class TestPassagesController < ApplicationController
  before_action :set_test_passege, only: %i[show result update send_message message]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      flash[:alert] = t('.time_end') if @test_passage.end_time?
      BadgeService.new(@test_passage).call
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
