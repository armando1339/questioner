json.id @answer.id
json.body @answer.body

if @answer.user
  json.asked_by @answer.user.email
  json.asked_by_id @answer.user.id
end