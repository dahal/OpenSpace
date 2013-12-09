class ListSpace < ActiveRecord::Base
  attr_accessible :address1, :address2, :area, :available_date, :city, :description, :price, :state, :zipcode, :image
  has_attached_file :image
  has_many :line_items
end
