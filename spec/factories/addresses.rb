FactoryBot.define do
  factory :address do
    postal_coad             { '123-4567' }
    pref_id                 { 2 }
    city              { '横浜市' }
    addresses_coad { "あお町1-1" }
    telephone            { "0120-828-828"} 
  end
end
