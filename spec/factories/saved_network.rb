FactoryGirl.define do
  factory :saved_network do

    #attributes
    address { Faker::Lorem.sentence }
    latitude { rand(0..50) }
    longitude { rand (0..50) }
    wifi_name "wifi_name"
    wifi_pw "wifi_pw"

    #associations
    user
  end
end