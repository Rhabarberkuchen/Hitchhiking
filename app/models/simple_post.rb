class SimplePost < ApplicationRecord
  belongs_to :user
  has_one :hh_attribute, dependent: :destroy

  validates_presence_of :title
  accepts_nested_attributes_for :hh_attribute, allow_destroy: true
  before_save :mark_hh_attribute_for_removal

  mount_uploaders :pictures, PostPicturesUploader
  serialize :pictures, JSON

  # validates_associated :hh_attribute

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
