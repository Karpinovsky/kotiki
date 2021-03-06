class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles, id: false do |t|
      t.references :user, foreign_key: true, index: true
      t.string :full_name
      t.string :username, null: false
      t.string :avatar
      t.text :about_me

      t.timestamps
    end

    add_index :profiles, :username, unique: true
  end
end
