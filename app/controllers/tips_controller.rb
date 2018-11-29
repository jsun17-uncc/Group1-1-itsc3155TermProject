# this controller handles how tips within the application are handled
class TipsController < ApplicationController
    
    # this will display all tips in the database in a list
    def index
        @tips = Tip.all
    end
    
    # the method is used  to take the user to the new tip form 
    def new
        @tip = Tip.new
    end
    
    #the def create will take the parameters passed in and creates a new tip based on what was entered
    def create
        @tip = Tip.new(tip_params)
        if @tip.save
            redirect_to @tip
        else
            render 'new'
        end
    end
    
    # this method was created to find the specified tip and show it
    def show
        @tip = Tip.find(params[:id])
    end
    
    # this method was created to take the user to the tip edit page
    def edit
        @tip = Tip.find(params[:id])
    end
    
    #this method was created to update the tips. it will take the parameters and updates the specified tip
    def update
        @tip = Tip.find(params[:id])
        if @tip.update(tip_params)
            redirect_to @tip
        else
            render 'edit'
        end
    end
    
    # this method was created to destroy the specified tip
    def destroy
        @tip = Tip.find(params[:id])
        @tip.destroy
        
        redirect_to tips_path
    end
end

    #title, text, name, and category is taken
private
    def tip_params
        params.require(:tip).permit(:title, :text, :name, :category)
    end
