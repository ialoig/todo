class TodoItem < ActiveRecord::Base
	include ClassyEnum::ActiveRecord
  belongs_to :todo_list

  classy_enum_attr :priority, default: "medium"

  def completed?
  	!completed_at.blank?
  end
end
