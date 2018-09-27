class Location < ApplicationRecord
  belongs_to :hh_attribute
  geocoded_by :address       # can also be an IP address
  after_validation :geocode, if: ->(obj){ obj.address_changed?} 

end
