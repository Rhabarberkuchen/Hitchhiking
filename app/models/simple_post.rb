class SimplePost < ApplicationRecord
  belongs_to :user
# if the simple_post is destroyed, the hh_attribute is destroyed with it
  has_one :hh_attribute, dependent: :destroy

# sanitizing of the user's input
  validates_length_of :title, minimum: 5, maximum: 100, allow_blank: false
# this is for the form of hh_attribute, it's nested because with a simple_post there is a hh_attribute created
  accepts_nested_attributes_for :hh_attribute, allow_destroy: true

#if there is no input in the hh_attribute's form, since it has been build in controller previously, it's not needed and must be destroyed
  before_save :mark_hh_attribute_for_removal

  mount_uploaders :pictures, PostPicturesUploader
# this is for making it possible to upload multiple pictures
  serialize :pictures, JSON

# checks if there is a next or a previous post to this one
  def next
    user.simple_posts.where("id > ?", id).first
  end
  def prev
    user.simple_posts.where("id < ?", id).last
  end

  def mark_hh_attribute_for_removal
    hh_attribute.mark_for_destruction if hh_attribute.everything_blank?
  end

end
