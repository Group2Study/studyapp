class TagType < ActiveRecord::Base
  has_many :tags

  scope :institute, -> { where(key: 'institute') }
  scope :theme, -> { where(key: 'theme') }
end
