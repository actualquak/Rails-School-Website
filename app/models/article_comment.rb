class ArticleComment < ApplicationRecord
  belongs_to :User, optional: true
  belongs_to :Article, optional: true
end
