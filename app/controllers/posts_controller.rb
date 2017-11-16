class PostsController < ApplicationController
	before_action :authenticate_user!, :except => [:create, :index, :createcomment]

  def index
  	@posts = Post.all
    # @user= current_user
  	# @ exposes a variable to the view

  end

  def create
  	@post = Post.new
  	@post.text=params[:text]
  	@post.save
  	redirect_to root_path
  end
  def createcomment
  	post = Post.find(params[:id])
  	comment = Comment.new
  	comment.text=params[:text]
  	comment.post=post
  	comment.save
  	redirect_to root_path
  end

  def vote
  	post = Post.find(params[:id])
  	post.votes=post.votes+1
  	post.save
  	redirect_to root_path
  end





end
