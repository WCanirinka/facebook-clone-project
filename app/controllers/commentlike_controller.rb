class CommentlikeController < ApplicationController
  def new
    @commentlike = CommentLike.new
  end

  def create
    @commentlike = CommentLike.new(comment_id: params[:comment_information][:comment_id],
                                   user_id: params[:comment_information][:user_id])
    redirect_to request.referrer || root_url if @commentlike.save
  end

  def destroy
    @commentlike = CommentLike.find(params[:id])
    @commentlike.destroy
    redirect_to request.referrer || root_url
  end
end
