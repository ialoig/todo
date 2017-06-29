class ChangePriorityDataTypeToInteger < ActiveRecord::Migration
  def change
  	change_column :todo_items, :priority, 'integer USING CAST(priority AS integer)'
  end
end
