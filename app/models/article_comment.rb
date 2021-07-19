class ArticleComment < ApplicationRecord
  belongs_to :User, optional: true
  belongs_to :Article, optional: true
  validates :content, presence: true, length: { minimum: 4, maximum: 512 }
end
