class CreateLeaguesUsersJoin < ActiveRecord::Migration
  def change
    create_table :leagues_users, :id => false do |t|
      t.integer "user_id"
      t.integer "league_id"

    end
    add_index :leagues_users, ["user_id", "league_id"]
  end
end
