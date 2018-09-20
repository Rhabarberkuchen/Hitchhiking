class HhAttribute < ApplicationRecord
  belongs_to :simple_post, optional: true


  validates_presence_of :start, :destination, :time, :stops, if: :everything_present?

  def everything_present?
    !start.blank? && !destination.blank? && !stops.blank? && !time.blank?
  end



    def everything_blank?
      start.blank? && destination.blank? && stops.blank? && time.blank?
    end

end
