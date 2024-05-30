json.current_page @pagy.page
json.per_page @pagy.items
json.total_pages @pagy.to

json.answers @answers do |answer|
  json.id answer.id
  json.title answer.body

  if answer.user
    json.asked_by answer.user.email
    json.asked_by_id answer.user.id
  end
end

json.message "OK"