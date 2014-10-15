class Task < ActiveRecord::Base
  belongs_to :list

	def self.delete_expired_tasks
			Task.where("created_at <= ?", 7.days.ago).destroy_all		
	end

	
end


