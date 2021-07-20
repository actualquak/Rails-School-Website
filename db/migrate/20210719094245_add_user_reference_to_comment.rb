class AddUserReferenceToComment < ActiveRecord::Migration[6.1]
  def change
    change_table :comments do |t|
      t.references :user, optional: true
    end
  end
end
