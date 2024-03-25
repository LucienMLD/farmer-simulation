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
class Farm < ApplicationRecord
  belongs_to :user
  validates :name, :city, :country, presence: true, allow_blank: false

  geocoded_by :city
  after_validation :geocode

  def address
    [city, country].compact.join(', ')
  end
end
