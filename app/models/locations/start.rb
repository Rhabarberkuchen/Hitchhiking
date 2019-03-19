module Locations
  class Start < Location
    # Destination inherits from Location and has one HHAttribute
    # the data table of HhAttribute contains a column with start_id
    has_one :hh_attribute, class_name: 'HhAttribute',
                           foreign_key: 'start_id'
  end
end
