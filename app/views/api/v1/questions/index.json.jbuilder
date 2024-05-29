json.array! @questions do |question|
  json.id question.id
  json.title question.title
  json.body question.body

  json.tags question.tags.map(&:name)
end