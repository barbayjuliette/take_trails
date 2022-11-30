if @trip.persisted?
  json.inserted_item render(partial: 'trips/photos', formats: :html, locals: {trip: @trip})
  json.popup render(partial: 'trips/popup', formats: :html, locals: {photo: @trip.photos.last})
  # json.popup render(partial: 'trips/carousel', formats: :html, locals: { photo: @trip.photos.last })
else
  json.my_form render(partial: 'trips/form', formats: :html, locals: { trip: @trip })
end
