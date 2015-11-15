class CreateLeagueUserInformations < ActiveRecord::Migration
  def change
    create_table :league_user_informations do |t|
      t.references :user
      t.references :league
      
      t.timestamps
    end
    add_index :league_user_informations, ["user_id", "league_id"]
  end
end
