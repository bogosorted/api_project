class ChangeColumnUserIdToUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :visits, :user_id_id, :user_id
  end
end
