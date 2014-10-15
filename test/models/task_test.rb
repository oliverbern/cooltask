require 'test_helper'

class TaskTest < ActiveSupport::TestCase
	test "deletes expired tasks" do
		task = Task.create! created_at: 8.days.ago
		
		Task.delete_expired_tasks
		
		refute Task.find_by(id: task.id)
	end
end
