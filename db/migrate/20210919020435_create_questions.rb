class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :question_name
      t.references :formulary, null: true, foreign_key: true

      t.timestamps
    end
  end
end
