class PostsController < ApplicationController

  def new
    #@posts = Post.where({ user_id: session[:user_id] })
    @post = Post.new
    @post.place_id = params["place_id"]
    
  end

  def create
    if @current_user
      @post = Post.new(params["post"])
      @post.user_id = @current_user.id
      @post.save
    else
      flash[:notice] = "Login first."
    end

    redirect_to "/places/#{@post.place.id}"

  end

  #def new
  #  @post = Post.new
  #end

  #def create
  #  if @current_user
  #    @post = Post.new(params["post"])
   #   @post.user_id = @current_user.id
   #   @post.save
   # else
  #    flash[:notice] = "Login first."
  #  end
  #  redirect_to "/posts"
 # end

end
