class RemoveUserIdFromBooks < ActiveRecord::Migration[6.0]
  def change

    remove_column :books, :user_id, :string
  end
end
