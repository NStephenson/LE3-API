class Resource < ApplicationRecord
  has_many :lesson_resources
  has_many :lessons, through: :lesson_resources
  belongs_to :type
end
