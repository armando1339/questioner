json.current_page @pagy.page
json.per_page @pagy.items
json.total_pages @pagy.to

json.questions @questions do |question|
  json.id question.id
  json.title question.title
  json.body question.body

  json.tags question.tags.map(&:name)
end

json.message "OK"