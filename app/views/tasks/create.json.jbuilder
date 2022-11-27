if @review.persisted?
  json.form render(partial: "tasks/form", formats: :html, locals: {trip: @trip, task: Task.new})
  json.inserted_item render(partial: "trips/task", formats: :html, locals: {task: @task})
else
  json.form render(partial: "tasks/form", formats: :html, locals: {trip: @trip, task: @task})
end
