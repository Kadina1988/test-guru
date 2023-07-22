# frozen_string_literal: true

class Badge < ApplicationRecord
  enum rule: [:backand]

  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :file , presence: true, uniqueness: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
end
