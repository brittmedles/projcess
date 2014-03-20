class Photo < ActiveRecord::Base
  attr_accessible :project_id, :user_id, :filename
  
  belongs_to :project
  belongs_to :user
end
