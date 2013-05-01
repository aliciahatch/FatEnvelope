# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :step do
    name "MyString"
    type_id 1
    instructions "MyText"
    video_mp4 "MyString"
    video_webm "MyString"
    writing_area false
    points 1
  end
end
