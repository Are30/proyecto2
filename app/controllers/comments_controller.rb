class CommentsController < ApplicationController
    before_action :set_article
    before_action :set_comment, only: [:destroy]
    before_action :authorize_comment_deletion!, only: [:destroy]

    def create
        @comment = @article.comments.create(comment_params.merge(user: current_user))
        redirect_to article_path(@article)
    end

    def destroy
        @comment.destroy
        redirect_to article_path(@article)
    end

  private
    def comment_params
        params.require(:comment).permit(:body)
    end

    def set_article
        @article = Article.find(params[:article_id])
    end

    def set_comment
        @comment = @article.comments.find(params[:id])
    end

    def authorize_comment_deletion!
        unless @comment.user == current_user || @article.user == current_user
            redirect_to article_path(@article), alert: "No tienes permiso para eliminar este comentario."
        end
    end
end