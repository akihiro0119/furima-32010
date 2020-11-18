FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"test00"}
    password_confirmation {password}
    first_name            {"あア亜"}
    last_name             {"あア亜"}
    first_name_kana       {"アアア"}
    last_name_kana        {"アアア"}
    birth_day             {"1930-02-01"}
  end
end