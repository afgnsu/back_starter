# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create!(name: "ART", projects_count: 0)
Category.create!(name: "DESIGN", projects_count: 0)
Category.create!(name: "FASHION", projects_count: 0)
Category.create!(name: "FOOD", projects_count: 0)
Category.create!(name: "GAMES", projects_count: 0)
Category.create!(name: "MUSIC", projects_count: 0)
Category.create!(name: "PUBLISHING", projects_count: 0)
Category.create!(name: "TECHNOLOGY", projects_count: 0)