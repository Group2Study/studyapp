class Meeting < ActiveRecord::Base
  belongs_to :group
  has_many :meeting_tags
  has_many :tags , :through => :meeting_tags
end
