class User < ApplicationRecord
  devise :database_authenticatable,
  :registerable,
  :recoverable,
  :rememberable,
  :validatable,
  :trackable,
  :confirmable

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages
  has_many :passed_tests, through: :test_passages, source: :test, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def list_tests(level)
    passed_tests.where(tests: { level: })
  end
end
