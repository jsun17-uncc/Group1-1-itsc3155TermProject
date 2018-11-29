#this controller regulates how the comments are handled
class CommentsController < ApplicationController
    
    # the def create is the mmethod for creating a comment on a tip
    def create
        @tip = Tip.find(params[:tip_id])
        @comment = @tip.comments.create(comment_params)
        redirect_to tip_path(@tip)
    end 
    
    # the def desroy is the method for deleting a comment on a tip
    def destroy
        @tip = Tip.find(params[:tip_id])
        @comment = @tip.comments.find(params[:id])
        @comment.destroy
        redirect_to tip_path(@tip)
    end 

    #def comment params.. 
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end 
        
end
