class CreatePossibleResponses < ActiveRecord::Migration
  def change
    create_table :possible_responses do |t|
      t.references :question
      t.string :name
      t.string :feedback

      t.timestamps
    end
    add_index :possible_responses, :question_id
  end
end
