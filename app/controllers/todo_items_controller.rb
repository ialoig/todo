class TodoItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_todo_list
	before_action :set_todo_item, except: [:create]

	def create
		if todo_item_params[:content].blank?
			flash[:alert] = "Todo item could not be created with null value."
		else
			@todo_item = @todo_list.todo_items.create(todo_item_params)
		end
		redirect_to @todo_list
	end

	def destroy
		if @todo_item.destroy
			flash[:notice] = "Todo item was deleted."
		else
			flash[:alert] = "Todo item could not be deleted."
		end
		redirect_to @todo_list
	end

	def complete
		@todo_item.update_attribute(:completed_at, Time.now)
		redirect_to @todo_list, notice: "Todo item completed."
	end

	def uncomplete
		@todo_item.update_attribute(:completed_at, '')
		redirect_to @todo_list, notice: "Todo item uncompleted."
	end

	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def set_todo_item
		@todo_item = @todo_list.todo_items.find(params[:id])
	end

	def todo_item_params
		params[:todo_item].permit(:content, :priority)
	end
end
