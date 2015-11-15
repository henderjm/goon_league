class CreateLeagueUsers < ActiveRecord::Migration
  def change
    create_table :league_users do |t|
      t.references :user
      t.references :league
      t.string :team_name
      t.integer :played
      t.integer :points
    end
    add_index :league_users, ["user_id", "league_id", "team_name"]
  end
end
