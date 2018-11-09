class TipsController < ApplicationController
    def index
        @tips = Tip.all
    end
    
    def new
        @tip = Tip.new
    end
    
    def create
        @tip = Tip.new(tip_params)
        if @tip.save
            redirect_to @tip
        else
            render 'new'
        end
    end
    
    def show
        @tip = Tip.find(params[:id])
    end
    
    def edit
        @tip = Tip.find(params[:id])
    end
    
    def update
        @tip = Tip.find(params[:id])
        if @tip.update(tip_params)
            redirect_to @tip
        else
            render 'edit'
        end
    end
    
    def destroy
        @tip = Tip.find(params[:id])
        @tip.destroy
        
        redirect_to tips_path
    end
end

private
    def tip_params
        params.require(:tip).permit(:title, :text, :name, :category)
    end
