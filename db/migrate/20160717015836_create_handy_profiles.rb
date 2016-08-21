class CreateHandyProfiles < ActiveRecord::Migration
  def change
    create_table :handy_profiles do |t|
      t.integer :user_id
      t.string :trade

      t.timestamps null: false
    end
  end
end
