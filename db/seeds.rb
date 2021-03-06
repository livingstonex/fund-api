# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(firstname: "Daniel", lastname: "Livingstone", email: "livingstone.dn@gmail.com", password: "user123")
event = Event.create(name: "Fashion Show", description: "A display of contemporary fashion outfits.", start: DateTime.now, end: DateTime.now)