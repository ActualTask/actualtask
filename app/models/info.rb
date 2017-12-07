class Info < ApplicationRecord


  validates :name, :presence => true
  validates :surname, :phone, :address, :presence => true
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


  after_validation :geocode
end
