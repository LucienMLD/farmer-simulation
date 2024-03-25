# == Schema Information
#
# Table name: farms
#
#  id         :bigint           not null, primary key
#  city       :string           not null
#  country    :string           default("France"), not null
#  latitude   :float
#  longitude  :float
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_farms_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :farm do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    user
    name { Faker::Company.name }
    city { Faker::Address.city }
    country { "France" }
  end
end
