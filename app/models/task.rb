class Task < ActiveRecord::Base
  belongs_to :list

	def self.delete_expired_tasks
			Task.where("created_at <= ?", 7.days.ago).destroy_all		
	end
	
	def deadline
		self.created_at + 6.days
	end
	
	def remaining_time
		Time.at(self.deadline.to_i - Time.now.to_i)
	end

end


