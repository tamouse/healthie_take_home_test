# frozen_string_literal: true

require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Provider.count.positive?
  warn 'Stopping seeds: database contains data'
  exit(-1)
end

10.times do |_i|
  Provider.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

100.times do |_i|
  c = Client.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
  rand(10).times do |_i|
    c.journal_entries.create(
      entry: Faker::Lorem.paragraphs(number: rand(3..10)).join("\n\n"),
      published: [true, false].sample,
      posted_at: Time.current.advance(days: -rand(60))
    )
  end

  p_a = Provider.all.sample([1, 1, 1, 1, 1, 2].sample)
  p_a.each do |p|
    Plan.create(
      client_id: c.id,
      provider_id: p.id,
      name: %i[basic premium].sample
    )
  end
end
