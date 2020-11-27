FactoryBot.define do
  factory :user_history do
    postal_coad             { '123-4567' }
    pref_id                 { 2 }
    city { '横浜市' }
    addresses_coad { '1-1' }
    telephone { '0120828828' }
    user_id  { 2 }
    item_id  { 2 }
    token { 'ke5K3fkEAZky6SQdF8EPmc9JrY64sxsyh1Ur0hsv7Nc8uN8l+Hkd26zy43NskIq2Y9vd/ucx/pdvqzu7Btj+NA==' }
  end
end
