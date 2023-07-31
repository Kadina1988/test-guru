# frozen_string_literal: true

class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :file , presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }

  enum rules: { category_complete: 0, level_complete: 1, first_try: 2 }
end
