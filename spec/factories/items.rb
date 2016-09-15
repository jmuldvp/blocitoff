FactoryGirl.define do
  factory :item do
    name Faker::Name.name
    # user_id user.id
    # confirmed_at Time.now
  end
end
