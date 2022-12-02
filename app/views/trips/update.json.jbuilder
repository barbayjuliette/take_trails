if @trip.persisted?
  json.inserted_item render(partial: 'trips/photos', formats: :html, locals: { trip: @trip })
  json.popup render(partial: 'trips/popup', formats: :html, locals: { photos: @trip.photos.last(@count) })
else
  json.my_form render(partial: 'trips/form', formats: :html, locals: { trip: @trip })
end
