class TipsController < ApplicationController
    def new
    end
    
    def index
        @tips = Tip.all
    end
    
    def create
        @tip = Tip.new(tip_params)
        @tip.save
        redirect_to @tip
    end
    
    def show
        @tip = Tip.find(params[:id])
    end
end

private
    def tip_params
        params.require(:tip).permit(:title, :text, :name, :category)
    end
