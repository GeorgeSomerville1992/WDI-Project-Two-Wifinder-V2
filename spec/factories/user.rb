FactoryGirl.define do
  factory :user do
    #attributes
    sequence(:name) { |n| "user-#{n}" }
    email { "#{name}@#{name}.com" }
    password "password"
    password_confirmation "password"
    role "user"
  end
  #   factory "admin" do
  #   role "admin"
  # end
end