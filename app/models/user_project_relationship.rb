class UserProjectRelationship < ActiveRecord::Base
  belongs_to :user, touch: true
  belongs_to :project, touch: true
end
