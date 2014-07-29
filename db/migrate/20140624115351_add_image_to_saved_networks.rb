class AddImageToSavedNetworks < ActiveRecord::Migration
  def change
    add_column :saved_networks, :image, :string
  end
end
