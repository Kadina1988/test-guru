class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_answers
    errors.add(:qategory_id, 'too much answers for question') if question.answers.size > 4
  end
end
