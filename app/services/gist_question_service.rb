class GistQuestionService
  Result = Struct.new(:html_url, :success?)

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    gist = @client.create_gist(gist_params)
    Result.new(gist.html_url, gist.html_url.present?)
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.gist_params.description', title: @test.title),
      files: {
        I18n.t('.gist_question_service.gist_params.files') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end
end
