class Blog < ActiveRecord::Base
  attr_accessible :content, :image, :name, :title
  has_attached_file :image
end
