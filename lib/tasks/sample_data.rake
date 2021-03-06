namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_citizens
    make_ideas
    make_relationships
  end
end

def make_citizens
  admin = Citizen.create!(name: "Example Citizen",
                       email: "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    Citizen.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_ideas
  citizens = Citizen.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(11)
    citizens.each { |citizen| citizen.ideas.create!(content: content) }
  end
end

def make_relationships
  citizens = Citizen.all
  citizen  = citizens.first
  followed_citizens = citizens[2..50]
  followers      = citizens[3..40]
  followed_citizens.each { |followed| citizen.follow!(followed) }
  followers.each      { |follower| follower.follow!(citizen) }
end