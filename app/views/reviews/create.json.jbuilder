if @review.persisted?
  json.reviewcard render(partial: "reviews/reviewcard", formats: :html, locals: { review: @review })
  json.userreviewcard render(partial: "reviews/userreviewcard", formats: :html, locals: { review: @review })
  json.overallrating render(partial: "reviews/overallrating", formats: :html, locals: { trail: @trip.trail })
# else
#   json.form render(partial: "reviews/reviewform", formats: :html, locals: {trip: @trip, review: @review})
end
