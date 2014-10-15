task delete_items: :environment do
  Task.delete_expired_tasks
end