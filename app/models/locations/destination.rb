module Locations
  # Destination inherits from Location and has one HHAttribute
  # the data table of HhAttribute contains a column with destination_id
  class Destination < Location
    has_one :hh_attribute, class_name: 'HhAttribute',
                           foreign_key: 'destination_id'
  end
end
