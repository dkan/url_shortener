class UrlsController < ApplicationController
    
    def index
        @urls = Url.all
    end
    
    def new
        @url = Url.new
    end
    
    def create
        @url = Url.new(params[:url])

        if @url.save
            flash[:message] = "Your short url is: localhost:3000/#{@url.short_url}"
        else
            flash[:error] = "Enter in a url"
        end
        redirect_to root_path
    end
    
    def show
        @url = Url.find_by_short_url(params[:short_url])
        @url.count += 1
        @url.save
        redirect_to "#{@url[:long_url]}"
    end
end
