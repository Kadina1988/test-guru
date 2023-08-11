class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :file, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }

  RULES = %w[category_complete level_complete first_try]
end
