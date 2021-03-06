class CreateLeagueTables < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :encrypted_password, null: false, default: ""
      t.string :generated_code, default: ""
      t.string :name
      t.integer :admin_user

      t.timestamps null: false
    end
    add_index :leagues, :name
  end
end
