class CreateNations < ActiveRecord::Migration
  def change
    create_table :nations do |t|
      t.string :slug
      t.string :client_uid
      t.string :secret_key

      t.timestamps
    end
  end
end
