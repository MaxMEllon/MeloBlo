FactoryGirl.define do
  factory :user, :class => 'User' do
    name "test"
    email "testtest@test.com"
    password "testtest"
  end
end
