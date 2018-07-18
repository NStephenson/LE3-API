require 'uri';

class Resource < ApplicationRecord
  has_many :lesson_resources
  has_many :lessons, through: :lesson_resources
  belongs_to :type

  validates :name, :link, presence: true
  validates :name, length: {in: 3..50}
  validates :description, length: {maximum: 300}
  validates :link, uniqueness: {case_sensitive: false}
  validates :link, format: {with: URI.regexp, message: "must properly formatted and contain http(s)://"}





end
