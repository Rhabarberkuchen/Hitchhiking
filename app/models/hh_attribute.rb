class HhAttribute < ApplicationRecord
  belongs_to :simple_post, optional: true
  belongs_to :start, class_name: 'Locations::Start'
  belongs_to :destination, class_name: 'Locations::Destination'

  accepts_nested_attributes_for :start, allow_destroy: true
  accepts_nested_attributes_for :destination, allow_destroy: true
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
#     start_attributes: [:id, :address, :longitude, :latitude, :hh_attribute_id, :_destroy],
#     destination_attributes: [:id, :address, :longitude, :latitude, :hh_attribute_id, :_destroy])
# end
# end
end
