FactoryBot.define do
  factory :plan do
    trait :solo do
      name { 'solo' }
      price_monthly { 2.0 }
      price_yearly { 2.0 }
      user_limit { 1 }
    end

    trait :startup do
      name { 'startup' }
      price_monthly { 20.0 }
      price_yearly { 18.0 }
      user_limit { 5 }
      additional_user_fee { 7.0 }
    end

    trait :enterprise do
      name { 'enterprise' }
      price_monthly { 60.0 }
      price_yearly { 55.0 }
      user_limit { 20 }
      additional_user_fee { 6.0 }
    end
  end
end
