class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  default_scope {order priority: :desc}

  enum priority: [:low, :medium, :high]

  def completed?
  	!completed_at.blank?
  end

end
