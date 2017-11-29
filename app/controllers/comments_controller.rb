class CommentsController < ApplicationController
  #
	before_action :authenticate_user!
  ###

  def vote

  	comment = Comment.find(params[:id])

    # current_user.posts_voted_for=[1,2,3]
    # current_user.save

    if current_user.posts_upvoted.include?(params[:id])
      comment.votes -= 1
      comment.save

      current_user.posts_upvoted.delete(params[:id])
      current_user.save

      comment.user.upvotes_received -= 1
      comment.user.save
    elsif current_user.posts_downvoted.include?(params[:id])
      comment.votes += 1
      comment.save

      current_user.posts_downvoted.delete(params[:id])
      current_user.save

      comment.user.downvotes_received -= 1
      comment.user.save
    elsif params[:upvote]
      comment.votes += 1
      comment.save

      current_user.posts_upvoted.push(params[:id])
      current_user.save

      comment.user.upvotes_received += 1
      comment.user.save
    elsif params[:downvote]
      comment.votes -= 1
      comment.save

      current_user.posts_downvoted.push(params[:id])
      current_user.save

      comment.user.downvotes_received += 1
      comment.user.save
    end


    if comment.votes == -2
      comment.user.auto_deleted_posts=comment.user.auto_deleted_posts+1
      comment.user.posts_downvoted.delete(comment)
      comment.user.posts_upvoted.delete(comment)
      comment.user.save
      comment.destroy
    end


  	redirect_to root_path
  end

end
