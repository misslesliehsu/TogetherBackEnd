# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Invitation.destroy_all
Vote.destroy_all
Idea.destroy_all
DateSuggestion.destroy_all
Friendship.destroy_all
User.destroy_all


15.times do
  User.create(first_name: Faker::Name.first_name, last_name:Faker::Name.last_name, email: Faker::Internet.email, password: "pw")
end


5.times do
  Idea.create(name: Faker::Friends.quote, location: Faker::Address.community, owner_id: User.all.sample.id, description: Faker::Seinfeld.quote)
end


12.times do
  Idea.all.sample.invitees.push(User.all.sample)
end

30.times do
  Friendship.create_reciprocal_for_ids(User.all.sample.id, User.all.sample.id)
end
