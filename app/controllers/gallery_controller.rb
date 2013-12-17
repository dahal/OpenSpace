class GalleryController < ApplicationController
	def index
		@space_gallery = ListSpace.all
	end

	def detail
	    @space_detail = ListSpace.find(params[:id]) #.all
	end

	#def search
	#	@space_gallery = ListSpace.find_by_sql ["Select * from list_spaces WHERE city like ? or state like ? or zipcode like ? or description like ?",params[:search],params[:search],params[:search],params[:search]]	
	#end

	def search_nearby
		if params[:search].present?
    		@space_gallery = ListSpace.near(params[:search], 50, :order => :distance)
  		else
    		@space_gallery = ListSpace.all
		end
	end 
end
