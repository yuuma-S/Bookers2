class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.string :user_id

      t.timestamps
    end
  end
end
