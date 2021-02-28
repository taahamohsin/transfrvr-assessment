# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
first_client = Client.create!(name: 'First Client', code: 'FC')
second_client = Client.create!(name: 'Second Client', code: 'SC')
third_client = Client.create!(name: 'Third Client', code: 'TC')

first_simulation = Simulation.create!(name: 'First Simulation')
second_simulation = Simulation.create!(name: 'Second Simulation')
third_simulation = Simulation.create!(name: 'Third Simulation')

ClientsSimulations.create!(client_id: first_client.id, simulation_id: first_simulation.id)
ClientsSimulations.create!(client_id: second_client.id, simulation_id: first_simulation.id)
ClientsSimulations.create!(client_id: second_client.id, simulation_id: second_simulation.id)
ClientsSimulations.create!(client_id: third_client.id, simulation_id: third_simulation.id)

first_user = User.create!(first_name: 'First', last_name: 'User', client_id: first_client.id)
second_user = User.create!(first_name: 'Second', last_name: 'User', client_id: second_client.id)
third_user = User.create!(first_name: 'Third', last_name: 'User', client_id: third_client.id)
