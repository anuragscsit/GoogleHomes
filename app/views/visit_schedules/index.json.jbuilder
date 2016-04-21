json.array!(@visit_schedules) do |visit_schedule|
  json.extract! visit_schedule, :id, :name, :email, :phone, :date, :time
  json.url visit_schedule_url(visit_schedule, format: :json)
end
