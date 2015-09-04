# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create Users
# Example: User.create([{first_name: "", last_name: "", email: "", password: "", password_confirmation: "", admin: [true/false] }])

User.create([
  {first_name: "Tyler", last_name: "Durden", email: "tyler@example.com", password: "password", password_confirmation: "password", admin: true },
  {first_name: "River", last_name: "Song", email: "river@example.com", password: "password", password_confirmation: "password", admin: true },
  {first_name: "Butch", last_name: "Cassidy", email: "butch@example.com", password: "password", password_confirmation: "password", admin: false },
  {first_name: "Diana", last_name: "Prince", email: "ww@example.com", password: "password", password_confirmation: "password", admin: false }
  ])

# Create Talks
# Example: Talk.create([{topic: "", description: "", is_assigned: [true/false(false by default)], user_id: integer, assigned_to: ""(nil by default), speak_date: date (nil by default) }])
Talk.create([
  {topic: "Continuous Integration", description: "What is Continuous Integration? How does it work? Travis CI, CodeShip, etc?", is_assigned: false, user_id: 1, assigned_to: nil, speak_date: nil },
  {topic: "Illustrator for Developers", description: "How to quickly get started with Illustrator and apply it to your workflow.", is_assigned: false, user_id: 1, assigned_to: nil, speak_date: nil },
  {topic: "Vim: It's Good", description: "Vim, a command line editor. Why you should use it? How you should use it? Advantages/Disadvantages?", is_assigned: false, user_id: 1, assigned_to: nil, speak_date: nil },
  {topic: "Building a Commenting System in Jekyll", description: "Want readers input on your Jekyll blog? Implement a comments section.", is_assigned: false, user_id: 1, assigned_to: nil, speak_date: nil },
  {topic: "Debugging Heroku", description: "Cover the common errors, gotchas and methodologies to solve the problem.", is_assigned: false, user_id: 2, assigned_to: nil, speak_date: nil },
  {topic: "Getting Started With Elasticsearch", description: "Real-time search and data analytics.", is_assigned: false, user_id: 2, assigned_to: nil, speak_date: nil },
  {topic: "Real-time search and data analytics.", description: "Supercharge your TDD with RSpec.", is_assigned: false, user_id: 2, assigned_to: nil, speak_date: nil },
  {topic: "HTTParty", description: "Making HTTP fun again. Consume restful web services with ease.", is_assigned: false, user_id: 3, assigned_to: nil, speak_date: nil },
  {topic: "Redis Getting Started", description: "Exploring data structure servers and how to apply them to our applications.", is_assigned: false, user_id: 3, assigned_to: nil, speak_date: nil },
  {topic: "Stripe Integration", description: "Integrate simple payment processing into your application.", is_assigned: false, user_id: 3, assigned_to: nil, speak_date: nil },
  {topic: "Getting Started with Vagrant", description: "Learn the ins and outs of utilizing your Vagrant environment to the fullest.", is_assigned: false, user_id: 4, assigned_to: nil, speak_date: nil },
  {topic: "Sidekiq", description: "Simple, efficient background processing for Ruby.", is_assigned: false, user_id: 4, assigned_to: nil, speak_date: nil }
  ])
