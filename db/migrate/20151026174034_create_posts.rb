class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.belongs_to :league, index:true
      t.string :text, null: false, default: ''
      t.string :username

      t.datetime :remember_created_at # allows for editing tracking
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
