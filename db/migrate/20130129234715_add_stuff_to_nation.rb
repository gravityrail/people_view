class AddStuffToNation < ActiveRecord::Migration
  def change
    change_table :nations do |t|
      t.remove :slug
      t.string :name
      t.string :url
      t.string :logo
    end
  end
end
