# This will guess the User class
FactoryGirl.define do
  factory :answer do
    body 'The correct answer'
    question
  end
end
