class User < ApplicationRecord
  has_secure_password
  
  attr_accessor :name, :birthday, :base, :countries

  validates_uniqueness_of :email
end
