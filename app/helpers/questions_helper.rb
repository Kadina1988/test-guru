module QuestionsHelper
  def question_header
    if action_name.in?('edit')
      "Edit #{@question.test.title} Question"
    elsif action_name.in?('new')
      "Create New  #{@test.title} Question"
    end
  end
end
