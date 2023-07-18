class User < ApplicationRecord
  attr_reader :backand_tests

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
  has_many :gists,      dependent: :destroy

  has_and_belongs_to_many :badges

  validates :email,        format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name,  presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def list_tests(level)
    passed_tests.where(tests: { level: })
  end

  def success_back_tests
    @backand_tests = []
    test_passages.each do |tp|
      @backand_tests << tp.test if tp.success? && tp.test.category_id == 1
    end
    if @backand_tests.uniq.count == Test.where(category_id: 1).count
      badges << Badge.find_by(rules: 'all backand tests') if Badge.find_by(rules: 'all backand tests').present?
      @backand_tests = nil
    end
  end

  # def result
  #   badge_backand    = Badge.find_by(rules: 'all backand tests')
  #   badge_level_easy = Badge.find_by(rules: 'all tests level easy')
  #   badge_first_time = Badge.find_by(rules: 'passed the first time')
  #   badge_great      = Badge.find_by(rules: 'great result')

  #   badges << badge_level_easy if all_tests_level_easy? && badge_level_easy.present?
  #   badges << badge_backand    if backender? && badge_backand.present?
  #   badges << badge_first_time if passed_first_time? && badge_first_time.present?
  #   badges << badge_great      if great_result? && badge_great.present?
  # end

  # private

  # def backender?
  #   find_success_tests
  #   @success_tests.keep_if { |t| t.category_id == 1 }
  #   @success_tests.uniq.count == Test.where(category_id: 1).count && passed_tests.last.category_id == 1
  # end

  # def all_tests_level_easy?
  #   find_success_tests
  #   @success_tests.keep_if { |t| t.level == 1 }
  #   @success_tests.uniq.count == Test.where(level: 1).count && passed_tests.last.level = 1
  # end

  # def passed_first_time?
  #   passed_test_ids.count(passed_tests.last.id) == 1
  # end

  # def great_result?
  #   test_passages.last.test_result == 100
  # end

  # def find_success_tests
  #   @success_tests = []
  #   test_passages.each do |passage|
  #     @success_tests << passage.test if passage.success?
  #   end
  # end
end
