class Group < ActiveRecord::Base
    
  has_many :group_tags
  has_many :tags , :through => :group_tags


end
