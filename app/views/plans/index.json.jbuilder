json.plans @plans do |plan|
  json.id plan.id
  json.name plan.name
  json.user_limit plan.user_limit
  json.price_monthly plan.price_monthly
  json.price_yearly plan.price_yearly
  json.additional_user_fee plan.additional_user_fee
end
