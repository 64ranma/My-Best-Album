class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @post = Post.new
    @posts = Post.all
    if params[:query]
      query = params[:query]
      @posts = @posts.where("singer_name LIKE ? OR album_name LIKE ?", "%#{query}%", "%#{query}%")
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)  
    else
      render :edit
    end
  end
    
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
end


  private

  def post_params
    params.require(:post).permit(:image, :album_name, :singer_name, :body)
  end



