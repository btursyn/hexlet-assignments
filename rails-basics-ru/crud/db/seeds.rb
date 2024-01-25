# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  Task.create(
    completed: Faker::Boolean.boolean,
    creator: Faker::Name.unique.name,
    description: Faker::Lorem.paragraphs.join("\n\n"),
    name: Faker::JapaneseMedia::Naruto.demon,
    performer: Faker::JapaneseMedia::Naruto.character,
    status: Faker::Tea.variety 
  )
end