FactoryGirl.define do
  factory :user, :class => 'Users' do
    name "test"
    email "testtest@test.com"
    password "testtest"
  end
end
