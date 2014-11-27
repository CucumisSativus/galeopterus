# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization_invitation do
    organization nil
    user nil
  end
end
