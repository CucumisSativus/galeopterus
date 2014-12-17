# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card, class: Card do
    title 'MyString'
    description 'MyText'
    list { FactoryGirl.create(:list) }
  end
end
