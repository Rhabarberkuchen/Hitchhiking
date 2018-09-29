module Locations
  class Start < Location
    has_one :hh_attribute, class_name: 'HhAttribute',
                           foreign_key: 'start_id'
  end
end
