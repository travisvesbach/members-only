class AddForeignKeyToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :foreign_key, :integer
  end
end
