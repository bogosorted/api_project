class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.datetime :date
      t.integer :status
      t.references :user_id, index: false
      t.datetime :checkin_at
      t.datetime :checkout_at

      t.timestamps
    end
  end
end
