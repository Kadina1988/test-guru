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
  has_many :gists, dependent: :destroy

  has_and_belongs_to_many :badges

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true


  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def list_tests(level)
    passed_tests.where(tests: { level: })
  end

  def result
    badges << Badge.find_by(rules: 'all backand tests') if backender?
    badges << Badge.find_by(rules: 'all tests level') if all_level_tests?(test_passages.last.test.level)
    badges << Badge.find_by(rules: 'passed the first time') if passed_first_time?
    badges << Badge.find_by(rules: 'great result') if great_result?
  end

  private

  def backender?
      success_tests = []
      test_passages.each do |passage|
        success_tests << passage.test if passage.success?
      end

      backand_tests = []
      success_tests.each do |t|
        backand_tests << t if t.category_id == 1
      end
      backand_tests.uniq.count == Test.where(category_id: 1).count
  end

  def all_level_tests?(level)
    success_tests = []
    test_passages.each do |passage|
      success_tests << passage.test if passage.success? && passage.test.level == level
    end
    success_tests.uniq.count == Test.where(level: level).count
  end

  def passed_first_time?
    last_success_test_id = if test_passages.last.success?
                          test_passages.last.test.id
                        end
    passed_test_ids.count(last_success_test_id) == 1
  end

  def great_result?
    test_passages.last.test_result == 100
  end
end
