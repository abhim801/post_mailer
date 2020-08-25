class PostsController < ApplicationController

  def index
    @posts = Post.active
  end

  def show
    @post = Post.find params[:id]
  end

  def search_posts
    posts = Post.active.where('DATE(created_at) = ?', params[:date])
    if posts.count > 0
      render json: { status: :ok, data: posts }
    else
      render json: { status: :not_found, data: '' }
    end
  end

  def mail_posts
    ApplicationMailer.send_mail_posts(params[:email], params[:date]).deliver_now
  end
end
