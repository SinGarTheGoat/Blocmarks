FactoryGirl.define do
  factory :user do |x|
    x.email Faker::Internet.email
    x.password "test12345"
    x.password_confirmation "test12345"
  end
end
