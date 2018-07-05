require 'uri';

class Resource < ApplicationRecord
  has_many :lesson_resources
  has_many :lessons, through: :lesson_resources
  belongs_to :type

  validates :name, :link, presence: true
  validates :link, uniqueness: {case_sensitive: false}
  # validates :link, format: /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/


end
