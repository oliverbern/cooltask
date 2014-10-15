json.array!(@tasks) do |task|
  json.extract! task, :id, :body, :days, :done, :list_id
  json.url task_url(task, format: :json)
end
