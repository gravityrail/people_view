class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.references :nation
      t.string :token

      t.timestamps
    end
  end
end
