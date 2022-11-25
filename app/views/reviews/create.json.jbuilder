if @review.persisted?
  json.form render(partial: "reviews/reviewform", formats: :html, locals: {trip: @trip, review: Review.new})
  json.inserted_item render(partial: "reviews/reviews", formats: :html, locals: {trip: @trip, review: @review})
else
  json.form render(partial: "reviews/reviewform", formats: :html, locals: {trip: @trip, review: @review})
end
