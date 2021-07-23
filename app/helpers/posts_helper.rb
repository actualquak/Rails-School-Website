module PostsHelper
  def set_posts
    @posts = Post.order("created_at DESC").page(params[:page])
  end
end
