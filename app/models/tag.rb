class Tag < ActiveRecord::Base

  has_one :tag_type
  #has_one :parent_tag :through :tag

end
