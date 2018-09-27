class HhAttribute < ApplicationRecord
  belongs_to :simple_post, optional: true
  has_one :start_location, class_name: "Location"
  has_one :destination_location, class_name: "Location"
  # has_many :locations, dependent: :destroy, inverse_of: :hh_attribute
  has_one :start, through: :start_location, source: :hh_attribute
  has_one :destination, through: :destination_location, source: :hh_attribute

  accepts_nested_attributes_for :start_location, allow_destroy: true
  accepts_nested_attributes_for :destination_location, allow_destroy: true
  validates_presence_of :time, :lifts, if: :everything_present?

  def everything_present?
    !everything_blank?
  end

  def everything_blank?
    lifts.blank? && time.blank?
  end

private
# def hh_attribute_params
#     params.require(:hh_attribute).permit(:time, :lifts, :id, :simple_post_id,
#     start_location_attributes: [:id, :address, :longitude, :latitude, :hh_attribute_id, :_destroy],
#     destination_location_attributes: [:id, :address, :longitude, :latitude, :hh_attribute_id, :_destroy])
# end
# end
end
