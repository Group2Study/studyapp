class Meeting < ActiveRecord::Base
  has_one :group
  has_many :meeting_tags
  has_many :tags , :through => :meeting_tags
end
