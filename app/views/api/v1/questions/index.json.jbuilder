json.current_page @pagy.page
json.per_page @pagy.items
json.total_pages @pagy.to

json.questions @questions do |question|
  json.id question.id
  json.title question.title
  json.body question.body

  json.tags question.tags.map(&:name)

  # Here answers but what happen if there are more than
  # one answer. Because the requirement just take in count
  # one answer
  #
  # Really enjoyed it!!
end

json.message "OK"