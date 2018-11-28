#this controller regulates how the comments are handled
class CommentsController < ApplicationController
    
    # method for creating a comment on a tip
    def create
        @tip = Tip.find(params[:tip_id])
        @comment = @tip.comments.create(comment_params)
        redirect_to tip_path(@tip)
    end 
    
    # method for deleting a comment on a tip
    def destroy
        @tip = Tip.find(params[:tip_id])
        @comment = @tip.comments.find(params[:id])
        @comment.destroy
        redirect_to tip_path(@tip)
    end 

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end 
        
end
