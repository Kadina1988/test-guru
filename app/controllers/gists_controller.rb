class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    test_passage = current_user.test_passages.last
    result = GistQuestionService.new(test_passage.current_question).call

    flash_options = if result.success?
                      gist = current_user.gists.create!(question_id: test_passage.current_question.id,
                                                        url: result.html_url)

                      { notice: t('.success_html', url: gist.url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to test_passage, flash_options
  end
end
