class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :email
      t.trackable
      t.string :provider
      t.string :uid

      t.timestamps
    end

    add_index :users, :email, unique: true
  end

end