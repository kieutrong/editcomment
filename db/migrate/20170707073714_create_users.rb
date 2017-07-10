class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :avatar, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.integer :gender, null: false, default: 0
      t.integer :adress, null: false, default: ""
      t.boolean :is_admin, null: false, default: false
      t.timestamps
    end
  end
end
