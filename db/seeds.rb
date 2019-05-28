# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# skill.each {|x| print x, " -- " }

skill = Skill.new(name: "Ruby on rails")
skill.save
skill = Skill.new(name: "HTML")
skill.save
skill = Skill.new(name: "CSS")
skill.save
skill = Skill.new(name: "Ruby on rails")
skill.save
skill = Skill.new(name: "HTML")
skill.save
skill = Skill.new(name: "CSS")
skill.save
