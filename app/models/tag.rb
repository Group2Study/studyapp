class Tag < ActiveRecord::Base
  belongs_to :tag_type

  scope :institutes, -> { where(tag_type: TagType.institute) }
  scope :themes, -> { where(tag_type: TagType.theme) }
  #has_one :parent_tag :through :tag

end
