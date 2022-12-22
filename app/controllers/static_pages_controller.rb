class StaticPagesController < ApplicationController
    require 'flickr'

    def index
        flickr = Flickr.new
        if params[:user_id]
            begin
                @photos = flickr.photos.search(user_id: params[:user_id])
            rescue => exception
                flash[:alert] = "User ID not found, please check and try again"
            end
        end
    end

end
