Plan.where(name: :solo).first_or_create!(price_monthly: 2.0)
Plan.where(name: :startup).first_or_create!(
  price_monthly: 20.0,
  price_yearly: 18.0,
  user_limit: 5,
  additional_user_fee: 7.0,
)
Plan.where(name: :enterprise).first_or_create!(
  price_monthly: 60.0,
  price_yearly: 55.0,
  user_limit: 20,
  additional_user_fee: 6.0,
)
