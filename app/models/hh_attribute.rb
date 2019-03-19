class HhAttribute < ApplicationRecord
  # a simple_post doesn't have to have a hh_attribute
  belongs_to :simple_post, optional: true
  belongs_to :start, class_name: 'Locations::Start'
  belongs_to :destination, class_name: 'Locations::Destination'

# nested attributes for the form
  accepts_nested_attributes_for :start, allow_destroy: true
  accepts_nested_attributes_for :destination, allow_destroy: true
  # sanitizing
  validates_presence_of :lifts
  validates :lifts, numericality: { only_integer: true,  greater_than_or_equal_to: 1, less_than: 50 }, allow_blank: true
  validates :days, numericality: { only_integer: true, less_than: 100 }, allow_blank: true
    validates :hours, numericality: { only_integer: true, less_than: 25 }, allow_blank: true
      validates :hours, numericality: { only_integer: true, less_than: 61 }, allow_blank: true

# everything has to be filled so that a hh_attribute can be created
  def everything_present?
    !everything_blank?
  end

# everything has to be blank so that no hh_attribute will be created
  def everything_blank?
    lifts.blank? && time.blank?
  end

private
# def hh_attribute_params
#     params.require(:hh_attribute).permit(:time, :lifts, :id, :simple_post_id,
#     start_attributes: [:id, :address, :longitude, :latitude, :hh_attribute_id, :_destroy],
#     destination_attributes: [:id, :address, :longitude, :latitude, :hh_attribute_id, :_destroy])
# end
# end
end
