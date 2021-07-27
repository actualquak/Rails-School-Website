class Article < ApplicationRecord
  include PgSearch::Model
  validates :title, presence: true
  validates :content, presence: true
  has_many :article_comments, dependent: :destroy
  has_many :comments, as: :commentable
  pg_search_scope :search_for, against: { title: 'A', content: 'B' }
end
