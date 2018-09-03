class SimplePost < ApplicationRecord
  belongs_to :user

  mount_uploaders :pictures, PostPicturesUploader
  serialize :pictures, JSON
end
