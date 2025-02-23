FactoryBot.define do
  factory :user do
    sequence :email_address do |n|
      "person#{n}@example.com"
    end
    password { "password" }
    first_name { "Test" }
    last_name { "Test" }
  end
end
