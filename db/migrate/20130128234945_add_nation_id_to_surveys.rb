class AddNationIdToSurveys < ActiveRecord::Migration
  def change
    change_table :surveys do |t|
      t.references :nation
    end
  end
end
