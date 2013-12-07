class GalleryController < ApplicationController
	def index
		@space_gallery = ListSpace.all
	end

	def detail
	    @space_detail = ListSpace.find(params[:id]) #.all
	end
end
