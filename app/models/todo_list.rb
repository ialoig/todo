class TodoList < ActiveRecord::Base
	has_many :todo_items, dependent: :destroy
	belongs_to :user
<<<<<<< HEAD
=======

	def count_completed
		@todo_item = self.todo_items.all
		count = 0
		@todo_item.each do |item|
			if !item.completed_at.blank?
				count += 1
			end
		end
		return count
	end


	def item_completition
		division = (count_completed / self.todo_items.size.to_f) *100
		return division.to_i
	end
>>>>>>> master
end
