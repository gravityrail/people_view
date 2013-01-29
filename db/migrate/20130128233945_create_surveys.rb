class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :slug
      t.string :site_slug
      t.string :status

      t.timestamps
    end
  end
end
