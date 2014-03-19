class User < ActiveRecord::Base
  attr_accessible :project_name, :user_name
end
