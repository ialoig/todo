class RemoveUserToTodoItem < ActiveRecord::Migration
  def change
  	remove_column :todo_items, :user_id
  end
end
