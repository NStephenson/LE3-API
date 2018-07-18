class Lesson < ApplicationRecord
  has_many :lesson_resources
  has_many :resources, through: :lesson_resources


  def deslug(slug)
    slug.split("_").join(" ")
  end

  def slug
  	self.name.split(' ').join('_')
  end

  def self.find_or_create_by_slug(slug) 
    self.find_or_create_by(name: slug.gsub(/[^\w\s]/, ''))
  end

end
