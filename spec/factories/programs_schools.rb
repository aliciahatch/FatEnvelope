# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :programs_school, :class => 'ProgramsSchools' do
    program_id 1
    school_id 1
  end
end
