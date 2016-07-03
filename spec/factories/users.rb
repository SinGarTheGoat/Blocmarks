FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    encrypted_password nil
  end
end
