class AddArticleIdToComments < ActiveRecord::Migration[6.1]
  def change
    change_table :comments do |t|
      t.references :article, optional: true, default: nil
    end
  end
end
