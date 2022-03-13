class PostsController < ApplicationController

  def new
    @posts = Post.where({ user_id: session[:user_id] })
    @post = Post.new
    @post.place_id = params["place_id"]
    
  end

  def create
    if @current_user
      @post = Post.new(params["post"])
      @post.save
    end

    redirect_to "/places/#{@post.place.id}"

  end

#-------------
#def index
#  @tasks = Task.where({ user_id: session[:user_id] })
#  @task = Task.new
#end

#def create
#  if @current_user
#    @task = Task.new(params["task"])
#    @task.save
#  end
  
#  redirect_to "/tasks"
#end

#def destroy
#  @task = Task.find(params["id"])
#  if @current_user && @task.user_id == @current_user.id
#    @task.destroy
#  end

#  redirect_to "/tasks"
#end
#---------

end
