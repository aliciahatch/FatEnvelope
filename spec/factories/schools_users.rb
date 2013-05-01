# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schools_user, :class => 'SchoolsUsers' do
    school_id 1
    user_id 1
  end
end
