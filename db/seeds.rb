# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lesson = Lesson.create(name: "ROCK DODGER")
resource = Resource.create(
  name: "A link to google", 
  link: "https://www.google.com", 
  description: "Sometimes the simpliest solution is to just google, my friend",
  type: Type.create(name: "Other"),
)

resource.lessons << lesson
resource.save