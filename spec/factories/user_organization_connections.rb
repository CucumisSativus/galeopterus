# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_organization_connection do
    organization nil
    user nil
  end
end
