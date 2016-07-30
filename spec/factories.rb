FactoryGirl.define do
  factory :order do
    user_id 1
    product_id 1
    quantity 1
  end

  factory :user do
    username "MyString"
    email "MyString@dbc.com"
    password "MyString"
    admin true
  end

  factory :catalog do
    category_id 1
    product_id 1
  end

  factory :category do
    name { Faker::Name.name }
    after(:create) do |category|
      category.products << FactoryGirl.create(:product)
    end
  end

  factory :product do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.decimal(2) }
    remaining_qty {6}
  end
end
