class Photo < ActiveRecord::Base
  attr_accessible :filename, :proj_id, :timestamp
end
