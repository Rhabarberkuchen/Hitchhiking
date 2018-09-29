module Locations
  class Destination < Location
    has_one :hh_attribute, class_name: 'HhAttribute',
                           foreign_key: 'destination_id'
  end
end
