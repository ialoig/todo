class ChangePriorityDatatypeToInteger < ActiveRecord::Migration
  def change
  	change_column :todo_items, :priority, :integer 
  end
end
