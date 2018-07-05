class Lesson < ApplicationRecord
  has_many :lesson_resources
  has_many :resources, through: :lesson_resources


  def deslug(slug)
    slug.split("_").join(" ")
  end

end
