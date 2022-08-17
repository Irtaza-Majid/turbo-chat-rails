class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.boolean :is_privte, default: false

      t.timestamps
    end
  end
end
