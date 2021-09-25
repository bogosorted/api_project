class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :content
      t.references :formulary, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :visit, null: true, foreign_key: true
      t.datetime :answered_at

      t.timestamps
    end
  end
end
