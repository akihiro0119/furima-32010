FactoryBot.define do
  factory :item do
    title                 {"test"}
    explanation           {"test"}
    category_id           {2}
    status_id             {2}
    freight_id            {2}
    area_id               {2}
    shipdate_id           {2}
    price                 {500}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
