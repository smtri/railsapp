FactoryGirl.define do

  factory :user do
    name "name"
    sequence(:email) { |i| "mail2#{i}@mail.co" }
    password "pass"
  end

end