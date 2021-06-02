FactoryBot.define do
  factory :user do
    username { Faker::Kpop.girl_groups }
    password { Faker::Kpop.boy_bands }
  end
end
