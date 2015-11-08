class CreateLeagueTables < ActiveRecord::Migration
  def change
    create_table :league_tables do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :league_tables, :name
  end
end
