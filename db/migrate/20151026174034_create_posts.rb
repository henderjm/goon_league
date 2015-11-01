class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :text,     null: false, default: ''

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
