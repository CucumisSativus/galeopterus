# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    title 'MyString'
    board { FactoryGirl.create(:board)}
  end
end
