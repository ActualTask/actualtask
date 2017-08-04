class Info < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  geocoded_by :address do |obj,results|
    if geo = results.first
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
      obj.city    = geo.city
      obj.country_code = geo.country_code
    end
  end
  validates_presence_of  :name, :surname, :phone
  after_validation :geocode

end
