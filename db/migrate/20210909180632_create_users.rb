class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nick_name
      t.integer :password
      t.string :email
      t.string :cpf

      t.timestamps
    end
  end
end
