class CreateSavedNetworks < ActiveRecord::Migration
  def change
    create_table :saved_networks do |t|
      t.float :latitude
      t.float :longitude
      t.string :wifi_pw
      t.string :wifi_name
      t.references :user
      t.text :address
      t.string :security_type
      t.boolean :public

      t.timestamps
    end
    add_index :saved_networks, :user_id
  end
end
