class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    post_id = params[:id]
    @post = Post.find(post_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to(posts_path)
    else
      render('new')
    end
  end

  def edit
    post_id = params[:id]
    @post = Post.find(post_id)
  end

  def update
    post_id = params[:id]
    @post = Post.find(post_id)

    if @post.update(post_params)
      redirect_to(posts_path)
    else
      render('edit')
    end
  end

  def delete
    post_id = params[:id]
    @post = Post.find(post_id)
  end

  def destroy
    post_id = params[:id]
    @post = Post.find(post_id)

    @post.destroy
    redirect_to(posts_path)
  end


  private
  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :liked,
      :category_id
    )
  end
end