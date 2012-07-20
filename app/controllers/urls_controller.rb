class UrlsController < ApplicationController
    
    def index
        Url.all
    end
    
    def new
        @url = Url.new
    end
    
    def create
        @url = Url.new(params[:url])
        @url[:short_url] = @url.randomize
        if @url.save
            flash[:message] = "Your short url is: localhost:3000/#{@url[:short_url]}"
        else
            flash[:error] = "Enter in a url"
        end
        redirect_to root_path
    end
    
    def show
        @url = Url.find_by_short_url(params[:short_url])
        redirect_to "#{@url[:long_url]}"
    end
end
