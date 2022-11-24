if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {trip: @trip, review: Review.new})
  json.inserted_item render(partial: "shared/review", formats: :html, locals: {trip: @trip, review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {trip: @trip, review: @review})
end
