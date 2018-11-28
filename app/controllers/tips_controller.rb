# this controller handles how tips within the application are handled
class TipsController < ApplicationController
    
    # displays all tips in the database
    def index
        @tips = Tip.all
    end
    
    # method to take the user to the new tip form
    def new
        @tip = Tip.new
    end
    
    # takes the parameters passed in and creates a tip based on them
    def create
        @tip = Tip.new(tip_params)
        if @tip.save
            redirect_to @tip
        else
            render 'new'
        end
    end
    
    # method to find the specified tip and show it
    def show
        @tip = Tip.find(params[:id])
    end
    
    # method to take the user to the tip edit page
    def edit
        @tip = Tip.find(params[:id])
    end
    
    #takes the parameters and updates the specified tip
    def update
        @tip = Tip.find(params[:id])
        if @tip.update(tip_params)
            redirect_to @tip
        else
            render 'edit'
        end
    end
    
    # method to destroy the specified tip
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
