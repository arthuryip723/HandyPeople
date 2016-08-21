class AddDescriptionToHandyProfiles < ActiveRecord::Migration
  def change
    add_column :handy_profiles, :description, :string
  end
end
