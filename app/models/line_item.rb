class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :list_space_id, :month
  belongs_to :cart
  belongs_to :list_space

  def total_price
  	list_space.price * month
  end
end