# The ruby I write here will generate the json

# If the picture is saved
if @trip.persisted?
  # I want the form to be empty
  # json.my_form render(partial: 'trips/form', formats: :html, locals: { trip: @trip} )
  # I want to render the created picture (insert it inside the grid)
  json.inserted_item render(partial: 'trips/photos', formats: :html, locals: {trip: @trip})

# If not saved
else
  # I want to render the form with the validation errors
  json.my_form render(partial: 'trips/form', formats: :html, locals: { trip: @trip})
end
