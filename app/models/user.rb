class User < ActiveRecord::Base
  attr_accessible :name
  
  has_and_belongs_to_many :projects
  has_many :photos
end
