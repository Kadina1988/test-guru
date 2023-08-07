# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_NUMBER = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question
  before_save :set_success, unless: :new_record?

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def test_result
    result = 100 * (self.correct_questions.to_f / self.test.questions.count)
    result.round 2
  end

  def success?
    test_result >= SUCCESS_NUMBER
  end

  def number
    self.test.questions.where('id <= ?', current_question).count
  end

  def end_time?
    Time.current >= set_end_time
  end

  def set_end_time
    start_test = created_at
    seconds = test.timer * 60
    end_time = start_test + seconds
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort unless answer_ids.nil?
  end

  def correct_answers
    current_question.answers.correct
  end

  def set_next_question
    self.current_question = next_question
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question_id).first
    end
  end

  def set_success
    self.success = self.success?
  end

end
