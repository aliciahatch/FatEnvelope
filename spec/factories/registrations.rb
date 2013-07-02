# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :registration do
    program "MyString"
    price 1
    user nil
  end
end
