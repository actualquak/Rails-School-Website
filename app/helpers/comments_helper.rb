module CommentsHelper
  def comments_tree_for(comments)
    comments.map do |comment, nested_comments|
      render(comment) +
          (nested_comments.size > 0 ? content_tag(:div, comments_tree_for(nested_comments), class: "replies") : nil)
    end.join.html_safe
  end
  def get_comment_tree
    @comments = Comment.hash_tree
  end
  def get_comments_by_article_id article_id: nil
    @comments = Comment.where(article_id: article_id).hash_tree
  end
end
