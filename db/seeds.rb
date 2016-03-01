# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create!(name: "ART")
Category.create!(name: "DESIGN")
Category.create!(name: "FASHION")
Category.create!(name: "FOOD")
Category.create!(name: "GAMES")
Category.create!(name: "MUSIC")
Category.create!(name: "PUBLISHING")
Category.create!(name: "TECHNOLOGY")