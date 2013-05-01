# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    name "MyString"
    address "MyString"
    state "MyString"
    zip "MyString"
    admission_deadline "2012-06-19 18:08:07"
    ranking 1
  end
end
