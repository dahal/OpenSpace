class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
    has_many :line_items, :dependent => :destroy
  	def add_space(space_id)
	 current_item = line_items.build(:list_space_id => space_id)	
	end

	def total_price
		line_items.to_a.sum {|item| item.total_price }
	end
end
