class CommentsController < ApplicationController

   before_action :logged_in_user, only: [:create]

    # retrieve current user before creating
    include SessionsHelper

    def create
        user = current_user
        comment = user.comments.build(content: params[:content])
        comment.topic_id = params[:topic_id]
        if(comment.save)
            redirect_to :back
        end   
    end

    private

    def comment_params
        params.fetch(:comment, {}).permit(:content, :topic_id)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to root_path
      end
    end 

end
