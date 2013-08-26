# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    date "2013-08-23 16:20:25"
    user_id 1
    type ""
    student_id 1
  end
end
