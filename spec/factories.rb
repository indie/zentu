# generate factory with bundle exec rake db:populate


FactoryGirl.define do
  factory :citizen do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :idea do
    content "Lorem ipsum"
    user
  end
end