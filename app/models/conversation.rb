class Conversation < ActiveRecord::Base
  attr_accessible :project_id, :title, :user_id
end
