class ListSpace < ActiveRecord::Base
  attr_accessible :address1, :address2, :area, :available_date, :city, :description, :price, :state, :zipcode, :image
  has_attached_file :image
  has_many :line_items


  geocoded_by :address
  after_validation :geocode#, :if => :address_changed?

  def address
  	[address1, address2, city, state, zipcode].reject{|l| l.blank?}.join('</br>')
  end

end
