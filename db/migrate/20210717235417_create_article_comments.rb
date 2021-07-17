class CreateArticleComments < ActiveRecord::Migration[6.1]
  def change
    create_table :article_comments do |t|
      t.string :title
      t.text :content
      t.belongs_to :article, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
