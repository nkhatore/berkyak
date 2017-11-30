class PostsController < ApplicationController
  #
	before_action :authenticate_user!
  ###

  def index
    require 'open-uri'
    @ip = open('http://whatismyip.akamai.com').read
    current_user.ip_address = @ip
    current_user.save

# <%=Geocoder.search(@ip).first.city%>


    loc = Location.find_or_create_by(city: current_user.city)
    loc.save

		posts = loc.posts
		now = Time.now

		for post in posts
			diff = time_diff(Time.now, post.created_at)
			if diff[0..1].to_i > 24
				post.destroy
			end
		end

  	@posts = posts

  end

	# helper method
	def time_diff(start_time, end_time)
	  seconds_diff = (start_time - end_time).to_i.abs

	  hours = seconds_diff / 3600
	  seconds_diff -= hours * 3600

	  minutes = seconds_diff / 60
	  seconds_diff -= minutes * 60

	  seconds = seconds_diff

	  "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
	end

  def search
    loc = Location.find_or_create_by(city: current_user.city)
    @posts = loc.posts
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    end
  end

	def sortby
		loc = Location.find_or_create_by(city: current_user.city)
		@posts = loc.posts
		if params[:hot]
			@posts = @posts.order("votes DESC")
		elsif params[:new]
			@posts = @posts.order("created_at DESC")
		end
	end


  def create

    if current_user.auto_deleted_posts >= 3
      render :banned

    else
      require 'open-uri'
      ip = open('http://whatismyip.akamai.com').read
      current_user.ip_address = ip
      current_user.save

      loc = Location.find_or_create_by(city: current_user.city)
      loc.save


      post = Post.new
      post.text = params[:text]
			post.location = loc

			#if params[:votes] != 0
			#	post.votes = params[:votes]
			#end
      
			#if params[:user_id] != current_user.id
			#	post.user = User.find(params[:user_id])
			#else
      post.user = current_user
			#end
			
      post.time = Time.now

      post.save

      #
      current_user.posts_made = current_user.posts_made+1
      current_user.save
      ###
      redirect_to root_path
    end

    ###
  end



  def createcomment
  	post = Post.find(params[:id])
  	comment = Comment.new
  	comment.text = params[:text]
  	comment.post = post
    comment.user = current_user
  	comment.save
  	redirect_to root_path
  end



  def vote

  	post = Post.find(params[:id])

    #
    # current_user.posts_voted_for=[1,2,3]
    # current_user.save

    if current_user.posts_upvoted.include?(params[:id])
      post.votes -= 1
      post.save

      current_user.posts_upvoted.delete(params[:id])
      current_user.save

      post.user.upvotes_received=post.user.upvotes_received-1
      post.user.save
    elsif current_user.posts_downvoted.include?(params[:id])
      post.votes += 1
      post.save

      current_user.posts_downvoted.delete(params[:id])
      current_user.save

      post.user.downvotes_received=post.user.downvotes_received-1
      post.user.save
    elsif params[:upvote]
      post.votes += 1
      post.save

      current_user.posts_upvoted.push(params[:id])
      current_user.save

      post.user.upvotes_received=post.user.upvotes_received+1
      post.user.save
    elsif params[:downvote]
      post.votes -= 1
      post.save

      current_user.posts_downvoted.push(params[:id])
      current_user.save

        post.user.downvotes_received=post.user.downvotes_received+1
        post.user.save
    end


    if post.votes == -2
      post.user.auto_deleted_posts=post.user.auto_deleted_posts+1
      post.user.posts_downvoted.delete(post)
      post.user.posts_upvoted.delete(post)
      post.user.save
      post.destroy
    end

  	redirect_to root_path
  end




end
