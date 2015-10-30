class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name, :limit =>255
      t.string :second_name, :limit => 255
      t.integer :points, :default => 0

      t.timestamps
    end
  end
end
