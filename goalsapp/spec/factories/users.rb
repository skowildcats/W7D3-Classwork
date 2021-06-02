FactoryBot.define do
  factory :user do
    username { Faker::Kpop.girl_groups }
    password { "password" }

    factory :twice do
      username {:twice}
    end
  end
end
