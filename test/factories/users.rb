FactoryGirl.define do
  # Admin User
  factory :admin, class: User do
    first_name "Tyler"
    last_name "Durden"
    email "tyler@example.com"
    password "password"
    password_confirmation { |u| u.password }
    admin true
  end
  # Standard User
  factory :user do
    first_name "Butch"
    last_name "Cassidy"
    email "butch@example.com"
    password "password"
    password_confirmation { |u| u.password }
    admin false
  end
end
