class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content
      t.timestamps
      execute <<-SQL
        ALTER TABLE articles
        ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
          setweight(to_tsvector('english', coalesce(title, '')), 'A') ||
          setweight(to_tsvector('english', coalesce(content, '')), 'B')
        ) STORED;
      SQL
    end
  end
end
