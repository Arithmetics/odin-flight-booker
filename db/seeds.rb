# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

file = File.join(Rails.root, 'app', 'csv', 'codes.csv')
airport_codes = CSV.read(file).flatten

airport_codes.each do |entry|
  Airport.create(code: entry)
end
