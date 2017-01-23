class PostsController < ApplicationController
  def index
    @every_post = Post.all.order("id desc")
  end

  def show
    @showing_post = Post.find(params[:post_id])
  end

  def new
  end

  def create
    @title = params[:post_title]
    @content = params[:post_content]
    
    new_post = Post.new
    new_post.title = @title
    new_post.content = @content
    new_post.save
    
    redirect_to "/index"
  end

  def edit
     @editing_post = Post.find(params[:post_id])
  end

  def update
    @update_post = Post.find(params[:post_id])
    @update_post.title = params[:post_title]
    @update_post.content = params[:post_content]
    @update_post.save
    redirect_to "/index"
  end

  def delete
    @delete_post = Post.find(params[:post_id])
    @delete_post.destroy
    redirect_to "/index"
  end
end
