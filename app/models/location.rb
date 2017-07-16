class Location < ApplicationRecord
  has_many :infos
  geocoded_by :address do |obj,results|
    if geo = results.first
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
      obj.location_name = obj.address
      obj.address = geo.address
      obj.city    = geo.city
      obj.postal_code = geo.postal_code
      obj.country_code = geo.country_code
      obj.country = geo.country
      obj.state = geo.state
    end
  end
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
      obj.location_name = geo.address
      obj.address = geo.address
      obj.city    = geo.city
      obj.postal_code = geo.postal_code
      obj.country_code = geo.country_code
      obj.country = geo.country
      obj.state = geo.state
    end
  end

  after_validation :geocode, :reverse_geocode

end

# t.float :latitude
# t.float :longitude
# t.string :address
# t.string :country_code
# t.string :country
# t.string :city
# t.string :state
# t.string :postal_code