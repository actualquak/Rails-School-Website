module PostsHelper
  def set_posts
    @posts = Post.all.order("created_at DESC").limit(10)
  end
end
