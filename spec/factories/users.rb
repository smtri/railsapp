FactoryGirl.define do

  factory :user do
    name "name"
    sequence(:email) { |i| "mail#{i}@mail.co" }
    password "pass"
  end

  factory :invalid_user, parent: :user do |f|
    f.name nil
  end

end