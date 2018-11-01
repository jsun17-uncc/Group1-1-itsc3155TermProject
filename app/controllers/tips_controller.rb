class TipsController < ApplicationController
    def new
    end
    
    def create
        render plain: params[:tip].inspect
    end
end
