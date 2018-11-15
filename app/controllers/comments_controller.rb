class CommentsController < ApplicationController
    def create
        @tip = Tip.find(params[:tip_id])
        @comment = @tip.comments.create(comment_params)
        redirect_to tip_path(@tip)
    end 

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end 
        
end
