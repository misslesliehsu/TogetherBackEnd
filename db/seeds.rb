# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'net/http'
require 'open-uri'
require 'json'
url = 'https://randomuser.me/api/'
uri = URI.parse(url)

Invitation.destroy_all
Vote.destroy_all
Idea.destroy_all
DateSuggestion.destroy_all
Friendship.destroy_all
User.destroy_all

30.times do
  response = Net::HTTP.get_response(uri)
  info = JSON.parse(response.body)
  u = User.create(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, email: Faker::Internet.email, password: "pw")
  u.update(profile_pic: info["results"][0]["picture"]["thumbnail"])
end


50.times do
  Idea.create(name: Faker::Friends.quote, location: Faker::Address.community, owner_id: User.all.sample.id, description: Faker::Seinfeld.quote, scheduled_date: '')
end


50.times do
  idea = Idea.all.sample
  potentials = User.all - idea.invitees - [idea.owner]
  idea.invitees.push(potentials.sample)
end

100.times do
  u = User.all.sample
  potentials = User.all - u.friends
  Friendship.create_reciprocal_for_ids(u.id, potentials.sample.id)
end
