class TestPassagesController < ApplicationController
  before_action :set_test_passege, only: %i[show result update send_message message]

  def show
    session[:return_to] ||= request.referer
  end

  def result;end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to test_passage_path
    end
  end

  def message;end

  def send_message
    message = params[:message][:body]
    if message.empty?
      render :message
    else
      TestMailer.send_message(@test_passage, message).deliver_now
      redirect_back fallback_location: root_path, notice: t('.message_to_admin')
    end
  end

  private

  def set_test_passege
    @test_passage = TestPassage.find(params[:id])
  end
end
