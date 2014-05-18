# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@admin = User.create(email: "admin@example.com", password: "password", password_confirmation: "password")

@bowery_mission = Experience.new(id: 1, primary_contact_name: "John Doe", latitude: 40.722002, longitude: -73.992991, user_id: 1)
@bowery_mission.build_donation(donatable_id: 1, donatable_type: "Experience", title: "Bowery Mission", description: "Homeless Shelter", user_id: 1)
@bowery_mission.save

@icapital = Experience.new(id: 2, primary_contact_name: "Jane Doe", latitude: 40.7527987, longitude: -73.974788, user_id: 1)
@icapital.build_donation(donatable_id: 2, donatable_type: "Experience", title: "iCapitalNetwork", description: "A description", user_id: 1)
@icapital.save